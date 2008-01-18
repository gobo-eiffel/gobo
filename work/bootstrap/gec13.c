#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
T0* T931f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T931f4(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_SYNTAX_ERROR.default_message */
T0* T928f17(T0* C)
{
	T0* R = 0;
	R = (T928f19(C, ((T928*)(C))->a1));
	return R;
}

/* ET_SYNTAX_ERROR.message */
T0* T928f19(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T928f15(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T928f15(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T928f15(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T928f15(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T928*)(C))->a2), l3));
						if (t2) {
							t1 = (T928f15(C));
							t5 = (T86f5(GE_void(((T928*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T928f15(C));
								t5 = (T928f18(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T928f15(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T928f15(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_SYNTAX_ERROR.arguments */
T0* T928f18(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_SYNTAX_ERROR.string_ */
T0* T928f15(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_CLUSTER_ERROR.default_message */
T0* T927f12(T0* C)
{
	T0* R = 0;
	R = (T927f7(C, ((T927*)(C))->a1));
	return R;
}

/* ET_CLUSTER_ERROR.message */
T0* T927f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T927f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T927f9(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T927f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T927f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T927*)(C))->a2), l3));
						if (t2) {
							t1 = (T927f9(C));
							t5 = (T86f5(GE_void(((T927*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T927f9(C));
								t5 = (T927f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T927f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T927f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_CLUSTER_ERROR.arguments */
T0* T927f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_CLUSTER_ERROR.string_ */
T0* T927f9(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_VALIDITY_ERROR.default_message */
T0* T926f60(T0* C)
{
	T0* R = 0;
	R = (T926f18(C, ((T926*)(C))->a5));
	return R;
}

/* ET_VALIDITY_ERROR.message */
T0* T926f18(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T926f59(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T926f59(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T926f59(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T926f59(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T926*)(C))->a6), l3));
						if (t2) {
							t1 = (T926f59(C));
							t5 = (T86f5(GE_void(((T926*)(C))->a6), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T926f59(C));
								t5 = (T926f62(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T926f59(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T926f59(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_VALIDITY_ERROR.arguments */
T0* T926f62(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_VALIDITY_ERROR.string_ */
T0* T926f59(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_INTERNAL_ERROR.default_message */
T0* T925f5(T0* C)
{
	T0* R = 0;
	R = (T925f7(C, ((T925*)(C))->a1));
	return R;
}

/* ET_INTERNAL_ERROR.message */
T0* T925f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T925f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T925f9(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T925f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T925f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T925*)(C))->a2), l3));
						if (t2) {
							t1 = (T925f9(C));
							t5 = (T86f5(GE_void(((T925*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T925f9(C));
								t5 = (T925f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T925f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T925f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_INTERNAL_ERROR.arguments */
T0* T925f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_INTERNAL_ERROR.string_ */
T0* T925f9(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_SYSTEM_ERROR.default_message */
T0* T924f5(T0* C)
{
	T0* R = 0;
	R = (T924f7(C, ((T924*)(C))->a1));
	return R;
}

/* ET_SYSTEM_ERROR.message */
T0* T924f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T924f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T924f9(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T924f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T924f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T924*)(C))->a2), l3));
						if (t2) {
							t1 = (T924f9(C));
							t5 = (T86f5(GE_void(((T924*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T924f9(C));
								t5 = (T924f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T924f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T924f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_SYSTEM_ERROR.arguments */
T0* T924f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_SYSTEM_ERROR.string_ */
T0* T924f9(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T299f5(T0* C)
{
	T0* R = 0;
	R = (T299f3(C, ge1020ov4012));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T299f3(T0* C, T0* a1)
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
	t1 = (T299f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T299f4(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T299f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T299f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T299*)(C))->a1), l3));
						if (t2) {
							t1 = (T299f4(C));
							t5 = (T86f5(GE_void(((T299*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T299f4(C));
								t5 = (T299f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T299f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T299f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T299f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T299f4(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T298f5(T0* C)
{
	T0* R = 0;
	R = (T298f3(C, ge1031ov4012));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T298f3(T0* C, T0* a1)
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
	t1 = (T298f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T298f4(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T298f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T298f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T298*)(C))->a1), l3));
						if (t2) {
							t1 = (T298f4(C));
							t5 = (T86f5(GE_void(((T298*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T298f4(C));
								t5 = (T298f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T298f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T298f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
T0* T298f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T298f4(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T297f5(T0* C)
{
	T0* R = 0;
	R = (T297f3(C, ge1035ov4012));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T297f3(T0* C, T0* a1)
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
	t1 = (T297f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T297f4(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T297f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T297f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T297*)(C))->a1), l3));
						if (t2) {
							t1 = (T297f4(C));
							t5 = (T86f5(GE_void(((T297*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T297f4(C));
								t5 = (T297f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T297f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T297f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
T0* T297f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T296f5(T0* C)
{
	T0* R = 0;
	R = (T296f3(C, ge1027ov4012));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T296f3(T0* C, T0* a1)
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
	t1 = (T296f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T296f4(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T296f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T296f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T296*)(C))->a1), l3));
						if (t2) {
							t1 = (T296f4(C));
							t5 = (T86f5(GE_void(((T296*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T296f4(C));
								t5 = (T296f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T296f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T296f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
T0* T296f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T296f4(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T295f5(T0* C)
{
	T0* R = 0;
	R = (T295f3(C, ge1018ov4012));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T295f3(T0* C, T0* a1)
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
	t1 = (T295f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T295f4(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T295f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T295f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T295*)(C))->a1), l3));
						if (t2) {
							t1 = (T295f4(C));
							t5 = (T86f5(GE_void(((T295*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T295f4(C));
								t5 = (T295f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T295f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T295f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
T0* T295f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T295f4(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T217f2(T0* C)
{
	T0* R = 0;
	R = (T217f4(C, ge224ov4012));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T217f4(T0* C, T0* a1)
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
	t1 = (T217f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
				}
			} else {
				t1 = (T217f5(C));
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T217f5(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T217f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
						t2 = (T86f4(GE_void(((T217*)(C))->a1), l3));
						if (t2) {
							t1 = (T217f5(C));
							t5 = (T86f5(GE_void(((T217*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T217f5(C));
								t5 = (T217f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T217f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T217f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
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
T0* T217f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T217f5(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T114f5(T0* C)
{
	T0* R = 0;
	R = (T114f3(C, ge227ov4012));
	return R;
}

/* UT_MESSAGE.message */
T0* T114f3(T0* C, T0* a1)
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
	t1 = (T114f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
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
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T114f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
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
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T114f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T114f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
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
T0* T114f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T114f4(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T69f2(T0* C)
{
	T0* R = 0;
	R = (T69f4(C, ge234ov4012));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T69f4(T0* C, T0* a1)
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
	t1 = (T69f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
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
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T69f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
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
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T69f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T69f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
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
T0* T69f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T69f5(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T68f2(T0* C)
{
	T0* R = 0;
	R = (T68f4(C, ge223ov4012));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T68f4(T0* C, T0* a1)
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
	t1 = (T68f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
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
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T68f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
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
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T68f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T68f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
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
T0* T68f6(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T68f5(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T32f18(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T950f58(R, l5);
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
					T950f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T950f58(R, (T2)('$'));
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
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
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
										T950f58(l1, l5);
									}
								} else {
									t1 = (T32f18(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
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
									T950f58(l1, l5);
								}
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T950f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T950f36(l1)));
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
									T950f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T950f58(R, (T2)('{'));
									}
								}
								t1 = (T32f18(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T950f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T950f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T950f58(R, (T2)('{'));
							}
						}
						t1 = (T32f18(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T950f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* AP_ERROR.arguments */
T0* T32f19(T0* C)
{
	T0* R = 0;
	if (ge323os1721) {
		return ge323ov1721;
	} else {
		ge323os1721 = '\1';
		ge323ov1721 = R;
	}
	R = T23c4();
	ge323ov1721 = R;
	return R;
}

/* AP_ERROR.string_ */
T0* T32f18(T0* C)
{
	T0* R = 0;
	if (ge277os1729) {
		return ge277ov1729;
	} else {
		ge277os1729 = '\1';
		ge277ov1729 = R;
	}
	R = T26c19();
	ge277ov1729 = R;
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
	T1 R = 0;
	T6 t1;
	t1 = (T37f11(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.was_found */
T1 T36f14(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T36f10(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.was_found */
T1 T35f18(T0* C)
{
	T1 R = 0;
	T6 t1;
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
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
	T0* R = 0;
	T1 t1;
	T0* t2;
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
	T0* R = 0;
	T1 t1;
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
	T0* R = 0;
	T1 t1;
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
	T0* R = 0;
	T1 t1;
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
	T0* R = 0;
	T1 t1;
	T0* t2;
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
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T41*)(C))->a3) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T41*)(C))->a2);
	}
	t2 = (T41f18(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
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
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T37*)(C))->a8) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T37*)(C))->a3);
	}
	t2 = (T37f13(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
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
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T36*)(C))->a7) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T36*)(C))->a8);
	}
	t2 = (T36f11(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
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
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
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
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T35*)(C))->a9) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T35*)(C))->a10);
	}
	t2 = (T35f14(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
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
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T33*)(C))->a5) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T33*)(C))->a4);
	}
	t2 = (T33f10(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
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
T2 T951f6(T0* C)
{
	T2 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T1243*)(GE_void(((T951*)(C))->a3)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T1243f5(GE_void(((T951*)(C))->a3)));
	} else {
		R = (((((T0*)(GE_void(((T951*)(C))->a4)))->id==22)?((T22*)(((T951*)(C))->a4))->a9:((T1430*)(((T951*)(C))->a4))->a2));
	}
	return R;
}

/* DS_LINKED_QUEUE [CHARACTER_8].item */
T2 T1243f5(T0* C)
{
	T2 R = 0;
	R = (((T1353*)(GE_void(((T1243*)(C))->a2)))->a1);
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.end_of_input */
T1 T951f21(T0* C)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T1243*)(GE_void(((T951*)(C))->a3)))->a1);
	t2 = ((t1)==((T6)(GE_int32(0))));
	if (t2) {
		R = (((((T0*)(GE_void(((T951*)(C))->a4)))->id==22)?T22f25(((T951*)(C))->a4):((T1430*)(((T951*)(C))->a4))->a1));
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
T1 T960f16(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_closable */
T1 T951f7(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T22f32(T0* C)
{
	T1 R = 0;
	R = (T22f10(C));
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T6 T960f11(T0* C, T0* a1, T6 a2, T6 a3)
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
		t1 = ((((T960*)(C))->a4)==(EIF_VOID));
	}
	while (!(t1)) {
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(((T960*)(C))->a4), (T2)0));
		T17f53(GE_void(a1), t2, l2);
		((T960*)(C))->a4 = ((GE_void(((T960*)(C))->a4), (T0*)0));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T960*)(C))->a4)==(EIF_VOID));
		}
	}
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T960f7(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T960f8(C));
			t1 = (T79f1(GE_void(t3), a1, ge412ov25556));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T960f10(C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c36(l4);
				T17f48(GE_void(l5), l4);
				l4 = (T960f10(C, l5, (T6)(GE_int32(1)), l4));
				l3 = (T6)(GE_int32(1));
				t1 = (T6f1(&l3, l4));
				while (!(t1)) {
					t2 = (T17f10(GE_void(l5), l3));
					T17f53(GE_void(a1), t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					t1 = (T6f1(&l3, l4));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T960*)(C))->a1 = (T960f7(C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T960f10(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T0* t1;
	T6 t2;
	T14 t3;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f5(GE_void(t1), t2));
	R = (T960f13(C, ((T960*)(C))->a5, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T960f13(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T960f8(T0* C)
{
	T0* R = 0;
	if (ge269os1804) {
		return ge269ov1804;
	} else {
		ge269os1804 = '\1';
		ge269ov1804 = R;
	}
	R = T79c5();
	ge269ov1804 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T951f28(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	t1 = ((((T951*)(C))->a2)==((T6)(GE_int32(6))));
	if (!(t1)) {
		t1 = ((((T951*)(C))->a2)==((T6)(GE_int32(2))));
	}
	if (!(t1)) {
		t2 = (((T1243*)(GE_void(((T951*)(C))->a3)))->a1);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T951f32(C);
		t1 = (T951f21(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T951f6(C));
			T17f53(GE_void(a1), t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = ((((T951*)(C))->a2)==((T6)(GE_int32(1))));
		if (t1) {
			R = (((((T0*)(GE_void(((T951*)(C))->a4)))->id==22)?T22f29(((T951*)(C))->a4, a1, a2, a3):T1430f7(((T951*)(C))->a4, a1, a2, a3)));
		} else {
			R = (T951f28p1(C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T951f28p1(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 t1;
	T1 t2;
	T2 t3;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	t2 = (T6f1(&l1, l2));
	while (!(t2)) {
		T951f32(C);
		t2 = (T951f21(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T951f6(C));
			T17f53(GE_void(a1), t3, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t2 = (T6f1(&l1, l2));
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_STRING_INPUT_STREAM.read_to_string */
T6 T1430f7(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 t1;
	T1 t2;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	t2 = (T6f1(&l1, l2));
	while (!(t2)) {
		T1430f9(C);
		t2 = ((T1)(!(((T1430*)(C))->a1)));
		if (t2) {
			T17f53(GE_void(a1), ((T1430*)(C))->a2, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t2 = (T6f1(&l1, l2));
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T6 T22f29(T0* C, T0* a1, T6 a2, T6 a3)
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
		t1 = ((((T22*)(C))->a4)==(EIF_VOID));
	}
	while (!(t1)) {
		l5 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((T72*)(GE_void(((T22*)(C))->a4)))->a1);
		T17f53(GE_void(a1), t2, l1);
		((T22*)(C))->a4 = (((T72*)(GE_void(((T22*)(C))->a4)))->a2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l5)==(a3));
		if (!(t1)) {
			t1 = ((((T22*)(C))->a4)==(EIF_VOID));
		}
	}
	t1 = ((T1)((l5)<(a3)));
	if (t1) {
		t1 = (T22f27(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T22f35(C));
			t1 = (T79f1(GE_void(t3), a1, ge399ov1824));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T22f28(C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
			} else {
				t3 = (T22f35(C));
				t5 = (T22f37(C));
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
					t1 = (T6f1(&l3, l4));
					while (!(t1)) {
						t2 = (T17f10(GE_void(l2), l3));
						T17f53(GE_void(a1), t2, l1);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
						t1 = (T6f1(&l3, l4));
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
unsigned char ge399os1825 = '\0';
T0* ge399ov1825;
T0* T22f37(T0* C)
{
	T0* R = 0;
	if (ge399os1825) {
		return ge399ov1825;
	} else {
		ge399os1825 = '\1';
		ge399ov1825 = R;
	}
	R = T954c10((T6)(GE_int32(0)));
	ge399ov1825 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T22f35(T0* C)
{
	T0* R = 0;
	if (ge269os1804) {
		return ge269ov1804;
	} else {
		ge269os1804 = '\1';
		ge269ov1804 = R;
	}
	R = T79c5();
	ge269ov1804 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.name */
T0* T951f5(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T951*)(C))->a4)))->id==22)?((T22*)(((T951*)(C))->a4))->a2:T1430f6(((T951*)(C))->a4)));
	return R;
}

/* KL_STRING_INPUT_STREAM.name */
unsigned char ge310os1800 = '\0';
T0* ge310ov1800;
T0* T1430f6(T0* C)
{
	T0* R = 0;
	if (ge310os1800) {
		return ge310ov1800;
	} else {
		ge310os1800 = '\1';
		ge310ov1800 = R;
	}
	R = GE_ms("STRING", 6);
	ge310ov1800 = R;
	return R;
}

/* XM_NAMESPACE.is_equal */
T1 T1319f4(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	t1 = (((T1319*)(GE_void(a1)))->a1);
	t2 = ((((T1319*)(C))->a1)==(t1));
	if (!(t2)) {
		t2 = ((((T1319*)(C))->a1)!=(EIF_VOID));
		if (t2) {
			t1 = (T1319f3(C));
			t3 = (((T1319*)(GE_void(a1)))->a1);
			R = (T26f1(GE_void(t1), ((T1319*)(C))->a1, t3));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.is_equal */
T1 T366f10(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (((T366*)(GE_void(a1)))->a2);
	t2 = ((((T366*)(C))->a2)==(t1));
	if (t2) {
		t2 = ((((T366*)(C))->a2)==((T6)(GE_int32(0))));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T366*)(C))->a2)==((T6)(GE_int32(1))));
			if (t2) {
				t3 = (((T366*)(GE_void(a1)))->a3);
				R = (T366f15(C, ((T366*)(C))->a3, t3));
			} else {
				t2 = ((((T366*)(C))->a2)==((T6)(GE_int32(2))));
				if (t2) {
					t3 = (((T366*)(GE_void(a1)))->a3);
					t2 = (T366f15(C, ((T366*)(C))->a3, t3));
					if (t2) {
						t3 = (((T366*)(GE_void(a1)))->a4);
						R = (T366f15(C, ((T366*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
				} else {
					t3 = (((T366*)(GE_void(a1)))->a3);
					t2 = (T366f15(C, ((T366*)(C))->a3, t3));
					if (t2) {
						t3 = (((T366*)(GE_void(a1)))->a4);
						R = (T366f15(C, ((T366*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
					l1 = (T373f6(GE_void(((T366*)(C))->a5)));
					T1043f8(GE_void(l1));
					t3 = (((T366*)(GE_void(a1)))->a5);
					l2 = (T373f6(GE_void(t3)));
					T1043f8(GE_void(l2));
					t2 = (((T1043*)(GE_void(l1)))->a3);
					if (!(t2)) {
						t2 = ((T1)(!(R)));
					}
					while (!(t2)) {
						t3 = (T1043f6(GE_void(l1)));
						t4 = (T1043f6(GE_void(l2)));
						R = (T366f15(C, t3, t4));
						T1043f9(GE_void(l1));
						T1043f9(GE_void(l2));
						t2 = (((T1043*)(GE_void(l1)))->a3);
						if (!(t2)) {
							t2 = ((T1)(!(R)));
						}
					}
				}
			}
		}
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.same_string */
T1 T366f15(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T366f8(C));
	R = (T48f1(GE_void(t1), a1, a2));
	return R;
}

/* ET_IDENTIFIER.is_equal */
T1 T129f33(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	t1 = (T129f46(C));
	t2 = (T79f1(GE_void(t1), C, a1));
	if (t2) {
		R = (T129f35(C, a1));
	}
	return R;
}

/* STRING_8.is_equal */
T1 T17f19(T0* C, T0* a1)
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
		t2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T950*)(a1))->a1));
		t1 = ((l1)==(t2));
		if (t1) {
			t3 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a1:((T950*)(a1))->a2));
			t2 = (T17f21(C, ((T17*)(C))->a1, t3, l1));
			R = ((t2)==((T6)(GE_int32(0))));
		}
	}
	return R;
}

/* STRING_8.str_strict_cmp */
T6 T17f21(T0* C, T0* a1, T0* a2, T6 a3)
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

T0* GE_ma903(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T902)+c*sizeof(T0*));
	((T0*)(t1))->id = 902;
	((T902*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T902*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T903));
	((T0*)(R))->id = 903;
	((T903*)(R))->a1 = t1;
	((T903*)(R))->a2 = 1;
	((T903*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma86(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T85)+c*sizeof(T0*));
	((T0*)(t1))->id = 85;
	((T85*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T85*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T86));
	((T0*)(R))->id = 86;
	((T86*)(R))->a1 = t1;
	((T86*)(R))->a2 = 1;
	((T86*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma324(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T117)+c*sizeof(T6));
	((T0*)(t1))->id = 117;
	((T117*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T6 *i = ((T117*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T324));
	((T0*)(R))->id = 324;
	((T324*)(R))->a1 = t1;
	((T324*)(R))->a2 = 1;
	((T324*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma963(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T640)+c*sizeof(T0*));
	((T0*)(t1))->id = 640;
	((T640*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T640*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T963));
	((T0*)(R))->id = 963;
	((T963*)(R))->a1 = t1;
	((T963*)(R))->a2 = 1;
	((T963*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma348(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T347)+c*sizeof(T0*));
	((T0*)(t1))->id = 347;
	((T347*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T347*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T348));
	((T0*)(R))->id = 348;
	((T348*)(R))->a1 = t1;
	((T348*)(R))->a2 = 1;
	((T348*)(R))->a3 = (T6)c;
	return R;
}

T0* ge411ov9365;
T0* ge415ov2927;
T0* ge350ov25470;
T0* ge421ov10151;
T0* ge413ov9365;
T0* ge959ov7371;
T0* ge959ov7376;
T0* ge388ov1844;
T0* ge1174ov17169;
T0* ge1174ov17154;
T0* ge1174ov17147;
T0* ge1174ov17132;
T0* ge1174ov17157;
T0* ge1174ov17150;
T0* ge1174ov17158;
T0* ge1174ov17167;
T0* ge1174ov17160;
T0* ge1174ov17156;
T0* ge1174ov17144;
T0* ge1174ov17145;
T0* ge1174ov17159;
T0* ge1174ov17146;
T0* ge1174ov17133;
T0* ge1174ov17134;
T0* ge1174ov17135;
T0* ge1174ov17141;
T0* ge1174ov17143;
T0* ge1174ov17138;
T0* ge1174ov17163;
T0* ge1174ov17162;
T0* ge1174ov17139;
T0* ge1174ov17140;
T0* ge1174ov17137;
T0* ge1174ov17136;
T0* ge1170ov16927;
T0* ge959ov7373;
T0* ge959ov7375;
T0* ge959ov7267;
T0* ge959ov7297;
T0* ge959ov7271;
T0* ge959ov7348;
T0* ge777ov14154;
T0* ge777ov14117;
T0* ge777ov14053;
T0* ge777ov14239;
T0* ge959ov7347;
T0* ge959ov7302;
T0* ge959ov7304;
T0* ge959ov7357;
T0* ge959ov7320;
T0* ge959ov7314;
T0* ge959ov7262;
T0* ge959ov7343;
T0* ge959ov7312;
T0* ge777ov14134;
T0* ge777ov14070;
T0* ge954ov24430;
T0* ge954ov24429;
T0* ge954ov24428;
T0* ge777ov14213;
T0* ge959ov7341;
T0* ge959ov7305;
T0* ge959ov7299;
T0* ge959ov7342;
T0* ge959ov7276;
T0* ge959ov7298;
T0* ge959ov7349;
T0* ge959ov7368;
T0* ge959ov7316;
T0* ge959ov7318;
T0* ge959ov7317;
T0* ge959ov7361;
T0* ge959ov7264;
T0* ge959ov7319;
T0* ge959ov7346;
T0* ge959ov7303;
T0* ge959ov7345;
T0* ge959ov7309;
T0* ge959ov7358;
T0* ge959ov7356;
T0* ge959ov7307;
T0* ge777ov14216;
T0* ge959ov7329;
T0* ge959ov7327;
T0* ge959ov7313;
T0* ge959ov7261;
T0* ge959ov7263;
T0* ge959ov7266;
T0* ge959ov7335;
T0* ge959ov7308;
T0* ge959ov7359;
T0* ge959ov7364;
T0* ge959ov7328;
T0* ge959ov7336;
T0* ge959ov7268;
T0* ge959ov7321;
T0* ge959ov7315;
T0* ge959ov7265;
T0* ge959ov7301;
T0* ge959ov7292;
T0* ge959ov7291;
T0* ge959ov7284;
T0* ge959ov7283;
T0* ge959ov7282;
T0* ge959ov7277;
T0* ge959ov7272;
T0* ge959ov7270;
T0* ge959ov7334;
T0* ge959ov7322;
T0* ge959ov7310;
T0* ge959ov7355;
T0* ge777ov14149;
T0* ge777ov14092;
T0* ge959ov7300;
T0* ge959ov7372;
T0* ge959ov7269;
T0* ge959ov7365;
T0* ge959ov7360;
T0* ge959ov7354;
T0* ge959ov7294;
T0* ge959ov7293;
T0* ge959ov7285;
T0* ge959ov7289;
T0* ge959ov7288;
T0* ge959ov7287;
T0* ge959ov7286;
T0* ge959ov7281;
T0* ge959ov7280;
T0* ge959ov7279;
T0* ge959ov7278;
T0* ge959ov7274;
T0* ge959ov7273;
T0* ge959ov7275;
T0* ge777ov14061;
T0* ge777ov14082;
T0* ge777ov14072;
T0* ge777ov14065;
T0* ge777ov14095;
T0* ge777ov14058;
T0* ge777ov14235;
T0* ge957ov24418;
T0* ge957ov24412;
T0* ge957ov24406;
T0* ge957ov24414;
T0* ge957ov24408;
T0* ge957ov24402;
T0* ge957ov24417;
T0* ge957ov24411;
T0* ge957ov24405;
T0* ge957ov24419;
T0* ge957ov24413;
T0* ge957ov24407;
T0* ge777ov14129;
T0* ge957ov24416;
T0* ge957ov24410;
T0* ge957ov24404;
T0* ge777ov14123;
T0* ge777ov14202;
T0* ge777ov14168;
T0* ge777ov14211;
T0* ge777ov14157;
T0* ge777ov14127;
T0* ge958ov25292;
T0* ge958ov25050;
T0* ge958ov24914;
T0* ge958ov25290;
T0* ge958ov25048;
T0* ge958ov24912;
T0* ge958ov25291;
T0* ge958ov25049;
T0* ge958ov24913;
T0* ge777ov14098;
T0* ge957ov24415;
T0* ge957ov24409;
T0* ge957ov24403;
T0* ge950ov26637;
T0* ge950ov26635;
T0* ge950ov26633;
T0* ge1088ov5098;
T0* ge949ov25345;
T0* ge949ov25341;
T0* ge949ov25337;
T0* ge1005ov19355;
T0* ge389ov9418;
T0* ge587ov12158;
T0* ge587ov12159;
T0* ge949ov25346;
T0* ge949ov25342;
T0* ge949ov25338;
T0* ge956ov25354;
T0* ge956ov25353;
T0* ge958ov25247;
T0* ge958ov25021;
T0* ge958ov24869;
T0* ge958ov25249;
T0* ge958ov24871;
T0* ge958ov25242;
T0* ge958ov24864;
T0* ge958ov25245;
T0* ge958ov24867;
T0* ge958ov25241;
T0* ge958ov24863;
T0* ge958ov25240;
T0* ge958ov24862;
T0* ge777ov14229;
T0* ge777ov14096;
T0* ge777ov14322;
T0* ge777ov14323;
T0* ge777ov14324;
T0* ge777ov14325;
T0* ge777ov14326;
T0* ge777ov14327;
T0* ge777ov14328;
T0* ge777ov14329;
T0* ge777ov14330;
T0* ge777ov14331;
T0* ge777ov14332;
T0* ge777ov14333;
T0* ge777ov14334;
T0* ge777ov14335;
T0* ge777ov14336;
T0* ge777ov14337;
T0* ge777ov14338;
T0* ge777ov14339;
T0* ge777ov14340;
T0* ge777ov14341;
T0* ge777ov14342;
T0* ge777ov14343;
T0* ge777ov14344;
T0* ge777ov14345;
T0* ge777ov14387;
T0* ge777ov14388;
T0* ge777ov14389;
T0* ge777ov14054;
T0* ge777ov14055;
T0* ge777ov14056;
T0* ge777ov14057;
T0* ge777ov14059;
T0* ge777ov14060;
T0* ge777ov14062;
T0* ge777ov14063;
T0* ge777ov14064;
T0* ge777ov14066;
T0* ge777ov14067;
T0* ge777ov14068;
T0* ge777ov14069;
T0* ge777ov14071;
T0* ge777ov14073;
T0* ge777ov14074;
T0* ge777ov14075;
T0* ge777ov14076;
T0* ge777ov14077;
T0* ge777ov14078;
T0* ge777ov14079;
T0* ge777ov14080;
T0* ge777ov14081;
T0* ge777ov14083;
T0* ge777ov14084;
T0* ge777ov14085;
T0* ge777ov14086;
T0* ge777ov14087;
T0* ge777ov14088;
T0* ge777ov14089;
T0* ge777ov14090;
T0* ge777ov14091;
T0* ge777ov14093;
T0* ge777ov14094;
T0* ge777ov14097;
T0* ge777ov14099;
T0* ge777ov14100;
T0* ge777ov14105;
T0* ge777ov14106;
T0* ge777ov14107;
T0* ge777ov14108;
T0* ge777ov14101;
T0* ge777ov14102;
T0* ge777ov14103;
T0* ge777ov14104;
T0* ge777ov14109;
T0* ge777ov14110;
T0* ge777ov14111;
T0* ge777ov14112;
T0* ge777ov14113;
T0* ge777ov14114;
T0* ge777ov14115;
T0* ge777ov14116;
T0* ge777ov14118;
T0* ge777ov14119;
T0* ge777ov14120;
T0* ge777ov14121;
T0* ge777ov14122;
T0* ge777ov14124;
T0* ge777ov14125;
T0* ge777ov14126;
T0* ge777ov14128;
T0* ge777ov14130;
T0* ge777ov14131;
T0* ge777ov14132;
T0* ge777ov14133;
T0* ge777ov14135;
T0* ge777ov14136;
T0* ge777ov14137;
T0* ge777ov14138;
T0* ge777ov14139;
T0* ge777ov14140;
T0* ge777ov14141;
T0* ge777ov14142;
T0* ge777ov14143;
T0* ge777ov14144;
T0* ge777ov14145;
T0* ge777ov14146;
T0* ge777ov14147;
T0* ge777ov14148;
T0* ge777ov14150;
T0* ge777ov14151;
T0* ge777ov14152;
T0* ge777ov14153;
T0* ge777ov14155;
T0* ge777ov14156;
T0* ge777ov14158;
T0* ge777ov14159;
T0* ge777ov14160;
T0* ge777ov14161;
T0* ge777ov14162;
T0* ge777ov14163;
T0* ge777ov14164;
T0* ge777ov14165;
T0* ge777ov14166;
T0* ge777ov14167;
T0* ge777ov14169;
T0* ge777ov14170;
T0* ge777ov14171;
T0* ge777ov14172;
T0* ge777ov14173;
T0* ge777ov14174;
T0* ge777ov14175;
T0* ge777ov14176;
T0* ge777ov14177;
T0* ge777ov14178;
T0* ge777ov14179;
T0* ge777ov14180;
T0* ge777ov14181;
T0* ge777ov14182;
T0* ge777ov14183;
T0* ge777ov14184;
T0* ge777ov14185;
T0* ge777ov14186;
T0* ge777ov14187;
T0* ge777ov14188;
T0* ge777ov14189;
T0* ge777ov14190;
T0* ge777ov14191;
T0* ge777ov14192;
T0* ge777ov14193;
T0* ge777ov14194;
T0* ge777ov14195;
T0* ge777ov14196;
T0* ge777ov14197;
T0* ge777ov14198;
T0* ge777ov14199;
T0* ge777ov14200;
T0* ge777ov14201;
T0* ge777ov14203;
T0* ge777ov14204;
T0* ge777ov14205;
T0* ge777ov14206;
T0* ge777ov14207;
T0* ge777ov14208;
T0* ge777ov14209;
T0* ge777ov14210;
T0* ge777ov14212;
T0* ge777ov14214;
T0* ge777ov14215;
T0* ge777ov14217;
T0* ge777ov14218;
T0* ge777ov14219;
T0* ge777ov14220;
T0* ge777ov14221;
T0* ge777ov14222;
T0* ge777ov14223;
T0* ge777ov14225;
T0* ge777ov14226;
T0* ge777ov14227;
T0* ge777ov14228;
T0* ge777ov14230;
T0* ge777ov14231;
T0* ge777ov14232;
T0* ge777ov14233;
T0* ge777ov14234;
T0* ge777ov14236;
T0* ge777ov14237;
T0* ge777ov14238;
T0* ge777ov14240;
T0* ge777ov14241;
T0* ge777ov14242;
T0* ge777ov14243;
T0* ge777ov14244;
T0* ge777ov14245;
T0* ge777ov14246;
T0* ge777ov14247;
T0* ge777ov14248;
T0* ge777ov14249;
T0* ge777ov14250;
T0* ge777ov14251;
T0* ge777ov14252;
T0* ge777ov14253;
T0* ge777ov14254;
T0* ge777ov14255;
T0* ge777ov14256;
T0* ge777ov14257;
T0* ge777ov14258;
T0* ge777ov14259;
T0* ge777ov14260;
T0* ge777ov14261;
T0* ge777ov14262;
T0* ge777ov14263;
T0* ge777ov14265;
T0* ge777ov14266;
T0* ge777ov14267;
T0* ge777ov14268;
T0* ge777ov14269;
T0* ge777ov14270;
T0* ge777ov14271;
T0* ge777ov14272;
T0* ge777ov14273;
T0* ge777ov14274;
T0* ge777ov14275;
T0* ge777ov14276;
T0* ge777ov14277;
T0* ge777ov14278;
T0* ge777ov14279;
T0* ge777ov14280;
T0* ge777ov14281;
T0* ge777ov14282;
T0* ge777ov14283;
T0* ge777ov14284;
T0* ge777ov14285;
T0* ge777ov14286;
T0* ge777ov14287;
T0* ge777ov14288;
T0* ge777ov14289;
T0* ge777ov14290;
T0* ge777ov14291;
T0* ge777ov14292;
T0* ge777ov14293;
T0* ge777ov14294;
T0* ge777ov14295;
T0* ge777ov14296;
T0* ge777ov14297;
T0* ge777ov14298;
T0* ge777ov14299;
T0* ge777ov14300;
T0* ge777ov14301;
T0* ge777ov14302;
T0* ge777ov14303;
T0* ge777ov14304;
T0* ge777ov14305;
T0* ge777ov14306;
T0* ge777ov14307;
T0* ge777ov14308;
T0* ge777ov14309;
T0* ge777ov14310;
T0* ge777ov14311;
T0* ge777ov14312;
T0* ge777ov14313;
T0* ge777ov14314;
T0* ge777ov14315;
T0* ge777ov14316;
T0* ge777ov14317;
T0* ge777ov14318;
T0* ge777ov14319;
T0* ge777ov14320;
T0* ge286ov12084;
T0* ge386ov21045;
T0* ge386ov21042;
T0* ge970ov15894;
T0* ge384ov20937;
T0* ge958ov25258;
T0* ge958ov25024;
T0* ge958ov24880;
T0* ge958ov25257;
T0* ge958ov24879;
T0* ge958ov25289;
T0* ge958ov25047;
T0* ge958ov24911;
T0* ge958ov25288;
T0* ge958ov25046;
T0* ge958ov24910;
T0* ge777ov14264;
T0* ge777ov14224;
T0* ge958ov25294;
T0* ge958ov25052;
T0* ge958ov24916;
T0* ge958ov25293;
T0* ge958ov25051;
T0* ge958ov24915;
T0* ge1288ov10793;
T0* ge1288ov10792;
T0* ge1015ov4342;
T0* ge1015ov4343;
T0* ge1015ov4344;
T0* ge1015ov4345;
T0* ge1015ov4346;
T0* ge1015ov4347;
T0* ge1015ov4348;
T0* ge1015ov4349;
T0* ge1015ov4350;
T0* ge1015ov4351;
T0* ge1015ov4352;
T0* ge1015ov4353;
T0* ge1015ov4354;
T0* ge1015ov4355;
T0* ge1015ov4356;
T0* ge1015ov4357;
T0* ge1015ov4358;
T0* ge1015ov4359;
T0* ge1015ov4360;
T0* ge1015ov4361;
T0* ge1015ov4362;
T0* ge1015ov4363;
T0* ge1015ov4364;
T0* ge1015ov4365;
T0* ge1015ov4366;
T0* ge1015ov4367;
T0* ge1015ov4368;
T0* ge1015ov4369;
T0* ge1015ov4370;
T0* ge1015ov4371;
T0* ge1015ov4372;
T0* ge1015ov4373;
T0* ge1015ov4374;
T0* ge1015ov4375;
T0* ge1015ov4376;
T0* ge1015ov4377;
T0* ge1015ov4378;
T0* ge1015ov4379;
T0* ge1015ov4380;
T0* ge1015ov4381;
T0* ge1015ov4382;
T0* ge1015ov4383;
T0* ge1015ov4384;
T0* ge1015ov4385;
T0* ge1015ov4386;
T0* ge1015ov4387;
T0* ge1015ov4388;
T0* ge1015ov4389;
T0* ge1015ov4390;
T0* ge1015ov4391;
T0* ge1015ov4392;
T0* ge1015ov4393;
T0* ge1015ov4394;
T0* ge1015ov4395;
T0* ge1015ov4396;
T0* ge1015ov4397;
T0* ge1015ov4398;
T0* ge1015ov4399;
T0* ge1015ov4400;
T0* ge1015ov4401;
T0* ge1015ov4402;
T0* ge1015ov4403;
T0* ge1015ov4404;
T0* ge1015ov4405;
T0* ge1015ov4406;
T0* ge1015ov4407;
T0* ge1015ov4408;
T0* ge1015ov4409;
T0* ge1015ov4410;
T0* ge1015ov4411;
T0* ge1015ov4412;
T0* ge1015ov4413;
T0* ge1015ov4414;
T0* ge1015ov4415;
T0* ge1015ov4416;
T0* ge1015ov4417;
T0* ge1015ov4418;
T0* ge1015ov4419;
T0* ge1015ov4420;
T0* ge1015ov4421;
T0* ge1015ov4422;
T0* ge1015ov4423;
T0* ge1015ov4424;
T0* ge1015ov4425;
T0* ge1015ov4426;
T0* ge1015ov4427;
T0* ge1015ov4428;
T0* ge1015ov4429;
T0* ge1015ov4430;
T0* ge1015ov4431;
T0* ge1015ov4432;
T0* ge1015ov4433;
T0* ge1015ov4434;
T0* ge1049ov4309;
T0* ge1015ov4552;
T0* ge1015ov4539;
T0* ge1015ov4544;
T0* ge1015ov4545;
T0* ge1015ov4546;
T0* ge1015ov4533;
T0* ge1015ov4550;
T0* ge1015ov4554;
T0* ge1015ov4537;
T0* ge1015ov4529;
T0* ge1015ov4540;
T0* ge1015ov4538;
T0* ge1015ov4535;
T0* ge1015ov4549;
T0* ge1015ov4548;
T0* ge1015ov4531;
T0* ge1015ov4553;
T0* ge1015ov4530;
T0* ge1015ov4536;
T0* ge1015ov4551;
T0* ge1015ov4543;
T0* ge1015ov4532;
T0* ge1015ov4547;
T0* ge1015ov4541;
T0* ge1015ov4534;
T0* ge1015ov4557;
T0* ge1015ov4542;
T0* ge1015ov4555;
T0* ge1049ov4308;
T0* ge1049ov4307;
T0* ge1011ov18408;
T0* ge1295ov11330;
T0* ge1295ov11292;
T0* ge1295ov11290;
T0* ge1295ov11331;
T0* ge1295ov11303;
T0* ge1295ov11302;
T0* ge1295ov11313;
T0* ge1295ov11307;
T0* ge1295ov11306;
T0* ge1295ov11305;
T0* ge1295ov11311;
T0* ge1295ov11310;
T0* ge1295ov11312;
T0* ge1295ov11289;
T0* ge1295ov11315;
T0* ge1295ov11324;
T0* ge1298ov11145;
T0* ge1298ov11143;
T0* ge1298ov11144;
T0* ge1295ov11325;
T0* ge1295ov11326;
T0* ge1295ov11329;
T0* ge1295ov11327;
T0* ge1295ov11328;
T0* ge1295ov11322;
T0* ge1291ov20599;
T0* ge1291ov20600;
T0* ge1295ov11295;
T0* ge1295ov11318;
T0* ge1295ov11338;
T0* ge1295ov11339;
T0* ge1295ov11340;
T0* ge1295ov11333;
T0* ge1295ov11316;
T0* ge1295ov11317;
T0* ge1295ov11319;
T0* ge1295ov11323;
T0* ge61ov3996;
T0* ge61ov4003;
T0* ge59ov4244;
T0* ge320ov1718;
T0* ge58ov3479;
T0* ge61ov3999;
T0* ge61ov4006;
T0* ge61ov3997;
T0* ge61ov4004;
T0* ge61ov3998;
T0* ge61ov4005;
T0* ge61ov4000;
T0* ge61ov4007;
T0* ge61ov4001;
T0* ge61ov4008;
T0* ge58ov3474;
T0* ge58ov3473;
T0* ge58ov3481;
T0* ge58ov3480;
T0* ge1302ov20309;
T0* ge1302ov20310;
T0* ge1293ov25478;
T0* ge1293ov25480;
T0* ge958ov25272;
T0* ge958ov25032;
T0* ge958ov24894;
T0* ge958ov25271;
T0* ge958ov24893;
T0* ge958ov25095;
T0* ge958ov24944;
T0* ge958ov24717;
T0* ge958ov25269;
T0* ge958ov25031;
T0* ge958ov24891;
T0* ge958ov25268;
T0* ge958ov24890;
T0* ge958ov25094;
T0* ge958ov24943;
T0* ge958ov24716;
T0* ge958ov25062;
T0* ge958ov24929;
T0* ge958ov24684;
T0* ge958ov25061;
T0* ge958ov24683;
T0* ge958ov25274;
T0* ge958ov25034;
T0* ge958ov24896;
T0* ge958ov25299;
T0* ge958ov25055;
T0* ge958ov24921;
T0* ge958ov25300;
T0* ge958ov24922;
T0* ge958ov25297;
T0* ge958ov25054;
T0* ge958ov24919;
T0* ge958ov25298;
T0* ge958ov24920;
T0* ge958ov25190;
T0* ge958ov24989;
T0* ge958ov24812;
T0* ge958ov25303;
T0* ge958ov25057;
T0* ge958ov24925;
T0* ge958ov25304;
T0* ge958ov24926;
T0* ge958ov25301;
T0* ge958ov25056;
T0* ge958ov24923;
T0* ge958ov25302;
T0* ge958ov24924;
T0* ge958ov25188;
T0* ge958ov24988;
T0* ge958ov24810;
T0* ge958ov25126;
T0* ge958ov24960;
T0* ge958ov24748;
T0* ge958ov25128;
T0* ge958ov24750;
T0* ge958ov25064;
T0* ge958ov24686;
T0* ge958ov25063;
T0* ge958ov24685;
T0* ge958ov25276;
T0* ge958ov25035;
T0* ge958ov24898;
T0* ge958ov25270;
T0* ge958ov24892;
T0* ge958ov25275;
T0* ge958ov24897;
T0* ge958ov25189;
T0* ge958ov24811;
T0* ge958ov25124;
T0* ge958ov24746;
T0* ge958ov25130;
T0* ge958ov24752;
T0* ge958ov25127;
T0* ge958ov24749;
T0* ge958ov25125;
T0* ge958ov24747;
T0* ge958ov25170;
T0* ge958ov24971;
T0* ge958ov24792;
T0* ge958ov25080;
T0* ge958ov24937;
T0* ge958ov24702;
T0* ge958ov25078;
T0* ge958ov24700;
T0* ge958ov25072;
T0* ge958ov24936;
T0* ge958ov24694;
T0* ge958ov25071;
T0* ge958ov24935;
T0* ge958ov24693;
T0* ge958ov25283;
T0* ge958ov25041;
T0* ge958ov24905;
T0* ge958ov25287;
T0* ge958ov25045;
T0* ge958ov24909;
T0* ge958ov25262;
T0* ge958ov25027;
T0* ge958ov24884;
T0* ge958ov25286;
T0* ge958ov25044;
T0* ge958ov24908;
T0* ge958ov25169;
T0* ge958ov24979;
T0* ge958ov24791;
T0* ge958ov25171;
T0* ge958ov24793;
T0* ge958ov25277;
T0* ge958ov25036;
T0* ge958ov24899;
T0* ge958ov25264;
T0* ge958ov25028;
T0* ge958ov24886;
T0* ge958ov25265;
T0* ge958ov24887;
T0* ge958ov25168;
T0* ge958ov24978;
T0* ge958ov24790;
T0* ge958ov25164;
T0* ge958ov24977;
T0* ge958ov24786;
T0* ge958ov25165;
T0* ge958ov24787;
T0* ge958ov25156;
T0* ge958ov24974;
T0* ge958ov24778;
T0* ge958ov25167;
T0* ge958ov24789;
T0* ge958ov25166;
T0* ge958ov24788;
T0* ge958ov25163;
T0* ge958ov24976;
T0* ge958ov24785;
T0* ge958ov25135;
T0* ge958ov24964;
T0* ge958ov24757;
T0* ge958ov25134;
T0* ge958ov24963;
T0* ge958ov24756;
T0* ge958ov25133;
T0* ge958ov24962;
T0* ge958ov24755;
T0* ge958ov25132;
T0* ge958ov24961;
T0* ge958ov24754;
T0* ge958ov25131;
T0* ge958ov24753;
T0* ge958ov25070;
T0* ge958ov24934;
T0* ge958ov24692;
T0* ge958ov25068;
T0* ge958ov24933;
T0* ge958ov24690;
T0* ge958ov25098;
T0* ge958ov24945;
T0* ge958ov24720;
T0* ge958ov25099;
T0* ge958ov24721;
T0* ge958ov25082;
T0* ge958ov24938;
T0* ge958ov24704;
T0* ge958ov25081;
T0* ge958ov24703;
T0* ge958ov25083;
T0* ge958ov24705;
T0* ge958ov25107;
T0* ge958ov24949;
T0* ge958ov24729;
T0* ge958ov25096;
T0* ge958ov24718;
T0* ge958ov25097;
T0* ge958ov24719;
T0* ge958ov25141;
T0* ge958ov24965;
T0* ge958ov24763;
T0* ge958ov25138;
T0* ge958ov24760;
T0* ge958ov25145;
T0* ge958ov24966;
T0* ge958ov24767;
T0* ge958ov25142;
T0* ge958ov24764;
T0* ge958ov25139;
T0* ge958ov24761;
T0* ge958ov25146;
T0* ge958ov24768;
T0* ge958ov25143;
T0* ge958ov24765;
T0* ge958ov25140;
T0* ge958ov24762;
T0* ge958ov25147;
T0* ge958ov24769;
T0* ge958ov25254;
T0* ge958ov25023;
T0* ge958ov24876;
T0* ge958ov25152;
T0* ge958ov24970;
T0* ge958ov24774;
T0* ge958ov25151;
T0* ge958ov24773;
T0* ge958ov25137;
T0* ge958ov24759;
T0* ge958ov25136;
T0* ge958ov24758;
T0* ge958ov25144;
T0* ge958ov24766;
T0* ge958ov25150;
T0* ge958ov24969;
T0* ge958ov24772;
T0* ge958ov25149;
T0* ge958ov24968;
T0* ge958ov24771;
T0* ge958ov25148;
T0* ge958ov24967;
T0* ge958ov24770;
T0* ge958ov25232;
T0* ge958ov25016;
T0* ge958ov24854;
T0* ge958ov25230;
T0* ge958ov25015;
T0* ge958ov24852;
T0* ge958ov25085;
T0* ge958ov24939;
T0* ge958ov24707;
T0* ge958ov25198;
T0* ge958ov24994;
T0* ge958ov24820;
T0* ge958ov25084;
T0* ge958ov24706;
T0* ge958ov25197;
T0* ge958ov24819;
T0* ge958ov25196;
T0* ge958ov24993;
T0* ge958ov24818;
T0* ge958ov25115;
T0* ge958ov24954;
T0* ge958ov24737;
T0* ge958ov25113;
T0* ge958ov24952;
T0* ge958ov24735;
T0* ge958ov25112;
T0* ge958ov24734;
T0* ge958ov25119;
T0* ge958ov24956;
T0* ge958ov24741;
T0* ge958ov25118;
T0* ge958ov24740;
T0* ge958ov25120;
T0* ge958ov24957;
T0* ge958ov24742;
T0* ge958ov25180;
T0* ge958ov24983;
T0* ge958ov24802;
T0* ge958ov25179;
T0* ge958ov24801;
T0* ge958ov25178;
T0* ge958ov24800;
T0* ge958ov25177;
T0* ge958ov24799;
T0* ge958ov25181;
T0* ge958ov24984;
T0* ge958ov24803;
T0* ge958ov25101;
T0* ge958ov24946;
T0* ge958ov24723;
T0* ge958ov25100;
T0* ge958ov24722;
T0* ge958ov25106;
T0* ge958ov24728;
T0* ge958ov25103;
T0* ge958ov24947;
T0* ge958ov24725;
T0* ge958ov25104;
T0* ge958ov24726;
T0* ge958ov25195;
T0* ge958ov24817;
T0* ge958ov25102;
T0* ge958ov24724;
T0* ge958ov25116;
T0* ge958ov24738;
T0* ge958ov25105;
T0* ge958ov24948;
T0* ge958ov24727;
T0* ge958ov25110;
T0* ge958ov24950;
T0* ge958ov24732;
T0* ge958ov25108;
T0* ge958ov24730;
T0* ge958ov25109;
T0* ge958ov24731;
T0* ge958ov25203;
T0* ge958ov24998;
T0* ge958ov24825;
T0* ge958ov25199;
T0* ge958ov24995;
T0* ge958ov24821;
T0* ge958ov25201;
T0* ge958ov24996;
T0* ge958ov24823;
T0* ge958ov25111;
T0* ge958ov24951;
T0* ge958ov24733;
T0* ge958ov25117;
T0* ge958ov24955;
T0* ge958ov24739;
T0* ge958ov25192;
T0* ge958ov24991;
T0* ge958ov24814;
T0* ge958ov25175;
T0* ge958ov24981;
T0* ge958ov24797;
T0* ge958ov25202;
T0* ge958ov24997;
T0* ge958ov24824;
T0* ge958ov25114;
T0* ge958ov24953;
T0* ge958ov24736;
T0* ge958ov25121;
T0* ge958ov24958;
T0* ge958ov24743;
T0* ge958ov25193;
T0* ge958ov24992;
T0* ge958ov24815;
T0* ge958ov25191;
T0* ge958ov24990;
T0* ge958ov24813;
T0* ge958ov25176;
T0* ge958ov24982;
T0* ge958ov24798;
T0* ge958ov25194;
T0* ge958ov24816;
T0* ge958ov25295;
T0* ge958ov25053;
T0* ge958ov24917;
T0* ge958ov25296;
T0* ge958ov24918;
T0* ge958ov25267;
T0* ge958ov25030;
T0* ge958ov24889;
T0* ge958ov25266;
T0* ge958ov25029;
T0* ge958ov24888;
T0* ge958ov25260;
T0* ge958ov25026;
T0* ge958ov24882;
T0* ge958ov25261;
T0* ge958ov24883;
T0* ge958ov25259;
T0* ge958ov25025;
T0* ge958ov24881;
T0* ge959ov7362;
T0* ge959ov7363;
T0* ge959ov7374;
T0* ge959ov7296;
T0* ge959ov7311;
T0* ge959ov7366;
T0* ge958ov25285;
T0* ge958ov25043;
T0* ge958ov24907;
T0* ge958ov25224;
T0* ge958ov25012;
T0* ge958ov24846;
T0* ge958ov25223;
T0* ge958ov25011;
T0* ge958ov24845;
T0* ge958ov25222;
T0* ge958ov25010;
T0* ge958ov24844;
T0* ge958ov25221;
T0* ge958ov25009;
T0* ge958ov24843;
T0* ge958ov25220;
T0* ge958ov25008;
T0* ge958ov24842;
T0* ge958ov25219;
T0* ge958ov25007;
T0* ge958ov24841;
T0* ge958ov25225;
T0* ge958ov25013;
T0* ge958ov24847;
T0* ge958ov25234;
T0* ge958ov25017;
T0* ge958ov24856;
T0* ge958ov25235;
T0* ge958ov25018;
T0* ge958ov24857;
T0* ge958ov25231;
T0* ge958ov24853;
T0* ge959ov7367;
T0* ge959ov7338;
T0* ge959ov7340;
T0* ge959ov7337;
T0* ge959ov7339;
T0* ge959ov7323;
T0* ge959ov7324;
T0* ge959ov7325;
T0* ge959ov7326;
T0* ge959ov7330;
T0* ge959ov7331;
T0* ge959ov7332;
T0* ge959ov7333;
T0* ge958ov25158;
T0* ge958ov24780;
T0* ge958ov25161;
T0* ge958ov24975;
T0* ge958ov24783;
T0* ge958ov25154;
T0* ge958ov24973;
T0* ge958ov24776;
T0* ge958ov25157;
T0* ge958ov24779;
T0* ge958ov25074;
T0* ge958ov24696;
T0* ge958ov25173;
T0* ge958ov24980;
T0* ge958ov24795;
T0* ge958ov25284;
T0* ge958ov25042;
T0* ge958ov24906;
T0* ge958ov25073;
T0* ge958ov24695;
T0* ge958ov25172;
T0* ge958ov24794;
T0* ge958ov25256;
T0* ge958ov24878;
T0* ge958ov25255;
T0* ge958ov24877;
T0* ge958ov25075;
T0* ge958ov24697;
T0* ge958ov25174;
T0* ge958ov24796;
T0* ge958ov25252;
T0* ge958ov25022;
T0* ge958ov24874;
T0* ge958ov25253;
T0* ge958ov24875;
T0* ge958ov25092;
T0* ge958ov24942;
T0* ge958ov24714;
T0* ge958ov25087;
T0* ge958ov24940;
T0* ge958ov24709;
T0* ge958ov25090;
T0* ge958ov24712;
T0* ge958ov25089;
T0* ge958ov24711;
T0* ge958ov25088;
T0* ge958ov24941;
T0* ge958ov24710;
T0* ge958ov25273;
T0* ge958ov25033;
T0* ge958ov24895;
T0* ge958ov25278;
T0* ge958ov25037;
T0* ge958ov24900;
T0* ge777ov14321;
T0* ge958ov25060;
T0* ge958ov24928;
T0* ge958ov24682;
T0* ge958ov25207;
T0* ge958ov25001;
T0* ge958ov24829;
T0* ge958ov25214;
T0* ge958ov25005;
T0* ge958ov24836;
T0* ge958ov25213;
T0* ge958ov24835;
T0* ge958ov25212;
T0* ge958ov25004;
T0* ge958ov24834;
T0* ge958ov25211;
T0* ge958ov24833;
T0* ge958ov25210;
T0* ge958ov25003;
T0* ge958ov24832;
T0* ge958ov25209;
T0* ge958ov24831;
T0* ge958ov25208;
T0* ge958ov25002;
T0* ge958ov24830;
T0* ge958ov25206;
T0* ge958ov24828;
T0* ge958ov25281;
T0* ge958ov25039;
T0* ge958ov24903;
T0* ge958ov25279;
T0* ge958ov25038;
T0* ge958ov24901;
T0* ge958ov25218;
T0* ge958ov25006;
T0* ge958ov24840;
T0* ge958ov25217;
T0* ge958ov24839;
T0* ge958ov25237;
T0* ge958ov25019;
T0* ge958ov24859;
T0* ge958ov25239;
T0* ge958ov25020;
T0* ge958ov24861;
T0* ge958ov25229;
T0* ge958ov25014;
T0* ge958ov24851;
T0* ge958ov25216;
T0* ge958ov24838;
T0* ge958ov25215;
T0* ge958ov24837;
T0* ge958ov25233;
T0* ge958ov24855;
T0* ge958ov25228;
T0* ge958ov24850;
T0* ge958ov25263;
T0* ge958ov24885;
T0* ge958ov25079;
T0* ge958ov24701;
T0* ge958ov25077;
T0* ge958ov24699;
T0* ge958ov25076;
T0* ge958ov24698;
T0* ge958ov25067;
T0* ge958ov24932;
T0* ge958ov24689;
T0* ge958ov25066;
T0* ge958ov24931;
T0* ge958ov24688;
T0* ge958ov25182;
T0* ge958ov24985;
T0* ge958ov24804;
T0* ge958ov25122;
T0* ge958ov24959;
T0* ge958ov24744;
T0* ge958ov25123;
T0* ge958ov24745;
T0* ge958ov25184;
T0* ge958ov24986;
T0* ge958ov24806;
T0* ge958ov25185;
T0* ge958ov24807;
T0* ge958ov25183;
T0* ge958ov24805;
T0* ge958ov25186;
T0* ge958ov24987;
T0* ge958ov24808;
T0* ge958ov25205;
T0* ge958ov25000;
T0* ge958ov24827;
T0* ge958ov25204;
T0* ge958ov24999;
T0* ge958ov24826;
T0* ge958ov25065;
T0* ge958ov24930;
T0* ge958ov24687;
T0* ge959ov7369;
T0* ge958ov25160;
T0* ge958ov24782;
T0* ge958ov25162;
T0* ge958ov24784;
T0* ge958ov25155;
T0* ge958ov24777;
T0* ge958ov25153;
T0* ge958ov24972;
T0* ge958ov24775;
T0* ge958ov25159;
T0* ge958ov24781;
T0* ge958ov25086;
T0* ge958ov24708;
T0* ge958ov25187;
T0* ge958ov24809;
T0* ge958ov25282;
T0* ge958ov25040;
T0* ge958ov24904;
T0* ge959ov7344;
T0* ge863ov16446;
T0* ge856ov23616;
T0* ge859ov22640;
T0* ge835ov22672;
T0* ge1245ov10503;
T0* ge1226ov20157;
T0* ge1226ov20156;
T0* ge418ov9365;
T0* ge311ov9365;
T0* ge302ov9365;
T0* ge59ov4245;
T0* ge59ov4246;
T0* ge59ov4247;
T0* ge781ov23338;
T0* ge777ov14386;
T0* ge777ov14367;
T0* ge777ov14383;
T0* ge777ov14371;
T0* ge777ov14372;
T0* ge777ov14373;
T0* ge777ov14374;
T0* ge777ov14368;
T0* ge777ov14375;
T0* ge777ov14376;
T0* ge777ov14377;
T0* ge777ov14378;
T0* ge777ov14369;
T0* ge777ov14384;
T0* ge777ov14379;
T0* ge777ov14380;
T0* ge777ov14381;
T0* ge777ov14370;
T0* ge777ov14382;
T0* ge777ov14385;
T0* ge1293ov25477;
T0* ge1293ov25479;
T0* ge777ov14363;
T0* ge777ov14362;
T0* ge777ov14350;
T0* ge777ov14351;
T0* ge777ov14352;
T0* ge777ov14353;
T0* ge777ov14354;
T0* ge777ov14355;
T0* ge777ov14356;
T0* ge777ov14357;
T0* ge777ov14358;
T0* ge777ov14359;
T0* ge777ov14360;
T0* ge777ov14361;
T0* ge777ov14365;
T0* ge777ov14366;
T0* ge777ov14346;
T0* ge777ov14347;
T0* ge777ov14348;
T0* ge777ov14349;
T0* ge777ov14364;
T0* ge803ov21567;
T0* ge803ov21566;
T0* ge808ov23431;
T0* ge818ov23323;
T0* ge1026ov4012;
T0* ge1023ov4012;
T0* ge230ov4012;
T0* ge229ov4012;
T0* ge1017ov4012;
T0* ge1033ov4012;
T0* ge1030ov4012;
T0* ge1029ov4012;
T0* ge1025ov4012;
T0* ge1032ov4012;
T0* ge1024ov4012;
T0* ge1036ov4012;
T0* ge1020ov4012;
T0* ge1031ov4012;
T0* ge1035ov4012;
T0* ge1027ov4012;
T0* ge1018ov4012;
T0* ge224ov4012;
T0* ge227ov4012;
T0* ge234ov4012;
T0* ge223ov4012;
T0* ge412ov25556;
T0* ge399ov1824;
T0* geic3;
T0* geic4;
T0* geic5;

void GE_const_init()
{
	ge411ov9365 = (GE_ms("\n", 1));
	ge415ov2927 = (GE_ms("", 0));
	ge350ov25470 = (GE_ms("", 0));
	ge421ov10151 = (GE_ms("", 0));
	ge413ov9365 = (GE_ms("\n", 1));
	ge959ov7371 = (GE_ms(".bat", 4));
	ge959ov7376 = (GE_ms(".sh", 3));
	ge388ov1844 = (GE_ms("empty_name", 10));
	ge1174ov17169 = (GE_ms("no pattern compiled", 19));
	ge1174ov17154 = (GE_ms("unmatched parentheses", 21));
	ge1174ov17147 = (GE_ms("back reference to non-existent subpattern", 41));
	ge1174ov17132 = (GE_ms("compilation successfully", 24));
	ge1174ov17157 = (GE_ms("lookbehind assertion is not fixed length", 40));
	ge1174ov17150 = (GE_ms("missing ) after comment", 23));
	ge1174ov17158 = (GE_ms("malformed number after (\?(", 26));
	ge1174ov17167 = (GE_ms("invalid condition (\?(0)", 23));
	ge1174ov17160 = (GE_ms("assertion expected after (\?(", 28));
	ge1174ov17156 = (GE_ms("unrecognized character after (\?<", 32));
	ge1174ov17144 = (GE_ms("unrecognized character after (\?", 31));
	ge1174ov17145 = (GE_ms("too many capturing parenthesized sub-patterns", 45));
	ge1174ov17159 = (GE_ms("conditional group contains more than two branches", 49));
	ge1174ov17146 = (GE_ms("missing )", 9));
	ge1174ov17133 = (GE_ms("\\ at end of pattern", 19));
	ge1174ov17134 = (GE_ms("\\c at end of pattern", 20));
	ge1174ov17135 = (GE_ms("unrecognized character follows \\", 32));
	ge1174ov17141 = (GE_ms("nothing to repeat", 17));
	ge1174ov17143 = (GE_ms("internal error: unexpected repeat", 33));
	ge1174ov17138 = (GE_ms("missing terminating ] for character class", 41));
	ge1174ov17163 = (GE_ms("POSIX collating elements are not supported", 42));
	ge1174ov17162 = (GE_ms("unknown POSIX class name", 24));
	ge1174ov17139 = (GE_ms("invalid escape sequence in character class", 42));
	ge1174ov17140 = (GE_ms("range out of order in character class", 37));
	ge1174ov17137 = (GE_ms("number too big in {} quantifier", 31));
	ge1174ov17136 = (GE_ms("numbers out of order in {} quantifier", 37));
	ge1170ov16927 = (GE_ms("", 0));
	ge959ov7373 = (GE_ms(".cfg", 4));
	ge959ov7375 = (GE_ms(".h", 2));
	ge959ov7267 = (GE_ms("#define", 7));
	ge959ov7297 = (GE_ms("EIF_TRACE", 9));
	ge959ov7271 = (GE_ms("EIF_BOEHM_GC", 12));
	ge959ov7348 = (GE_ms("#include", 8));
	ge777ov14154 = (GE_ms("item", 4));
	ge777ov14117 = (GE_ms("call", 4));
	ge777ov14053 = (GE_ms("ANY", 3));
	ge777ov14239 = (GE_ms("end", 3));
	ge959ov7347 = (GE_ms("#ifdef", 6));
	ge959ov7302 = (GE_ms("EIF_WINDOWS", 11));
	ge959ov7304 = (GE_ms("#endif", 6));
	ge959ov7357 = (GE_ms("return", 6));
	ge959ov7320 = (GE_ms("GE_dts", 6));
	ge959ov7314 = (GE_ms("GE_catcall", 10));
	ge959ov7262 = (GE_ms("->", 2));
	ge959ov7343 = (GE_ms("GE_void", 7));
	ge959ov7312 = (GE_ms("GE_boxed", 8));
	ge777ov14134 = (GE_ms("equal_objects", 13));
	ge777ov14070 = (GE_ms("KL_ANY_ROUTINES", 15));
	ge954ov24430 = (GE_ms("giaaa", 5));
	ge954ov24429 = (GE_ms("GIAAA", 5));
	ge954ov24428 = (GE_ms("[$1] internal error.", 20));
	ge777ov14213 = (GE_ms("Current", 7));
	ge959ov7341 = (GE_ms("GE_show_console", 15));
	ge959ov7305 = (GE_ms("extern", 6));
	ge959ov7299 = (GE_ms("EIF_TYPE", 8));
	ge959ov7342 = (GE_ms("GE_types", 8));
	ge959ov7276 = (GE_ms("EIF_FALSE", 9));
	ge959ov7298 = (GE_ms("EIF_TRUE", 8));
	ge959ov7349 = (GE_ms("int", 3));
	ge959ov7368 = (GE_ms("void", 4));
	ge959ov7316 = (GE_ms("GE_const_init", 13));
	ge959ov7318 = (GE_ms("GE_deep_twin", 12));
	ge959ov7317 = (GE_ms("GE_deep", 7));
	ge959ov7361 = (GE_ms("switch", 6));
	ge959ov7264 = (GE_ms("case", 4));
	ge959ov7319 = (GE_ms("GE_default", 10));
	ge959ov7346 = (GE_ms("if", 2));
	ge959ov7303 = (GE_ms("else", 4));
	ge959ov7345 = (GE_ms("id", 2));
	ge959ov7309 = (GE_ms("GE_alloc", 8));
	ge959ov7358 = (GE_ms("sizeof", 6));
	ge959ov7356 = (GE_ms("memcpy", 6));
	ge959ov7307 = (GE_ms("for", 3));
	ge777ov14216 = (GE_ms("Result", 6));
	ge959ov7329 = (GE_ms("GE_mt", 5));
	ge959ov7327 = (GE_ms("GE_ma", 5));
	ge959ov7313 = (GE_ms("GE_call", 7));
	ge959ov7261 = (GE_ms("ac", 2));
	ge959ov7263 = (GE_ms("break", 5));
	ge959ov7266 = (GE_ms("default", 7));
	ge959ov7335 = (GE_ms("GE_object_id_free", 17));
	ge959ov7308 = (GE_ms("fprintf", 7));
	ge959ov7359 = (GE_ms("stderr", 6));
	ge959ov7364 = (GE_ms("type_id", 7));
	ge959ov7328 = (GE_ms("GE_ms", 5));
	ge959ov7336 = (GE_ms("GE_power", 8));
	ge959ov7268 = (GE_ms("double", 6));
	ge959ov7321 = (GE_ms("GE_floor", 8));
	ge959ov7315 = (GE_ms("GE_ceiling", 10));
	ge959ov7265 = (GE_ms("char", 4));
	ge959ov7301 = (GE_ms("EIF_WIDE_CHAR", 13));
	ge959ov7292 = (GE_ms("EIF_REAL", 8));
	ge959ov7291 = (GE_ms("EIF_POINTER", 11));
	ge959ov7284 = (GE_ms("EIF_IS_WINDOWS", 14));
	ge959ov7283 = (GE_ms("EIF_IS_VMS", 10));
	ge959ov7282 = (GE_ms("EIF_IS_UNIX", 11));
	ge959ov7277 = (GE_ms("EIF_INTEGER", 11));
	ge959ov7272 = (GE_ms("EIF_CHARACTER", 13));
	ge959ov7270 = (GE_ms("EIF_BOOLEAN", 11));
	ge959ov7334 = (GE_ms("GE_object_id", 12));
	ge959ov7322 = (GE_ms("GE_id_object", 12));
	ge959ov7310 = (GE_ms("GE_argc", 7));
	ge959ov7355 = (GE_ms("memcmp", 6));
	ge777ov14149 = (GE_ms("is_equal", 8));
	ge777ov14092 = (GE_ms("TUPLE", 5));
	ge959ov7300 = (GE_ms("EIF_VOID", 8));
	ge959ov7372 = (GE_ms(".c", 2));
	ge959ov7269 = (GE_ms("EIF_ANY", 7));
	ge959ov7365 = (GE_ms("typedef", 7));
	ge959ov7360 = (GE_ms("struct", 6));
	ge959ov7354 = (GE_ms("is_special", 10));
	ge959ov7294 = (GE_ms("EIF_REAL_64", 11));
	ge959ov7293 = (GE_ms("EIF_REAL_32", 11));
	ge959ov7285 = (GE_ms("EIF_NATURAL", 11));
	ge959ov7289 = (GE_ms("EIF_NATURAL_64", 14));
	ge959ov7288 = (GE_ms("EIF_NATURAL_32", 14));
	ge959ov7287 = (GE_ms("EIF_NATURAL_16", 14));
	ge959ov7286 = (GE_ms("EIF_NATURAL_8", 13));
	ge959ov7281 = (GE_ms("EIF_INTEGER_64", 14));
	ge959ov7280 = (GE_ms("EIF_INTEGER_32", 14));
	ge959ov7279 = (GE_ms("EIF_INTEGER_16", 14));
	ge959ov7278 = (GE_ms("EIF_INTEGER_8", 13));
	ge959ov7274 = (GE_ms("EIF_CHARACTER_32", 16));
	ge959ov7273 = (GE_ms("EIF_CHARACTER_8", 15));
	ge959ov7275 = (GE_ms("EIF_DOUBLE", 10));
	ge777ov14061 = (GE_ms("DOUBLE", 6));
	ge777ov14082 = (GE_ms("REAL", 4));
	ge777ov14072 = (GE_ms("NATURAL", 7));
	ge777ov14065 = (GE_ms("INTEGER", 7));
	ge777ov14095 = (GE_ms("WIDE_CHARACTER", 14));
	ge777ov14058 = (GE_ms("CHARACTER", 9));
	ge777ov14235 = (GE_ms("deferred", 8));
	ge957ov24418 = (GE_ms("gvsrc5a", 7));
	ge957ov24412 = (GE_ms("GVSRC5", 6));
	ge957ov24406 = (GE_ms("[$1] root creation procedure `$3\' is not a feature of root class $2.", 68));
	ge957ov24414 = (GE_ms("vsrc1a", 6));
	ge957ov24408 = (GE_ms("VSRC1", 5));
	ge957ov24402 = (GE_ms("[$1] root class $2 should not be generic.", 41));
	ge957ov24417 = (GE_ms("gvsrc4a", 7));
	ge957ov24411 = (GE_ms("GVSRC4", 6));
	ge957ov24405 = (GE_ms("[$1] unknown root class $2.", 27));
	ge957ov24419 = (GE_ms("gvsrc6a", 7));
	ge957ov24413 = (GE_ms("GVSRC6", 6));
	ge957ov24407 = (GE_ms("[$1] root creation procedure `$3\' is not declared as publicly available creation procedure in root class $2.", 108));
	ge777ov14129 = (GE_ms("default_create", 14));
	ge957ov24416 = (GE_ms("gvsrc3a", 7));
	ge957ov24410 = (GE_ms("GVSRC3", 6));
	ge957ov24404 = (GE_ms("[$1] missing root class.", 24));
	ge777ov14123 = (GE_ms("closed_operands", 15));
	ge777ov14202 = (GE_ms("to_pointer", 10));
	ge777ov14168 = (GE_ms("pointer_item", 12));
	ge777ov14211 = (GE_ms("upper", 5));
	ge777ov14157 = (GE_ms("lower", 5));
	ge777ov14127 = (GE_ms("count", 5));
	ge958ov25292 = (GE_ms("gvkfe3a", 7));
	ge958ov25050 = (GE_ms("GVKFE-3", 7));
	ge958ov24914 = (GE_ms("attribute `$7\' in kernel class $5 has not the expected type \'$8\'.", 65));
	ge958ov25290 = (GE_ms("gvkfe1a", 7));
	ge958ov25048 = (GE_ms("GVKFE-1", 7));
	ge958ov24912 = (GE_ms("feature `$7\' is missing in kernel class $5.", 43));
	ge958ov25291 = (GE_ms("gvkfe2a", 7));
	ge958ov25049 = (GE_ms("GVKFE-2", 7));
	ge958ov24913 = (GE_ms("feature `$7\' in kernel class $5 is not an attribute.", 52));
	ge777ov14098 = (GE_ms("area", 4));
	ge957ov24415 = (GE_ms("gvknl1a", 7));
	ge957ov24409 = (GE_ms("GVKNL1", 6));
	ge957ov24403 = (GE_ms("[$1] missing kernel class $2.", 29));
	ge950ov26637 = (GE_ms("gaaaa", 5));
	ge950ov26635 = (GE_ms("GAAAA", 5));
	ge950ov26633 = (GE_ms("[$1] assembly $2: .NET assemblies not supported.", 48));
	ge1088ov5098 = (GE_ms(" \t\r\n", 4));
	ge949ov25345 = (GE_ms("gcaaa", 5));
	ge949ov25341 = (GE_ms("GCAAA", 5));
	ge949ov25337 = (GE_ms("[$1] cluster $2: cannot read cluster directory \'$3\'.", 52));
	ge1005ov19355 = (GE_ms("", 0));
	ge389ov9418 = (GE_ms("dummy", 5));
	ge587ov12158 = (GE_ms(".", 1));
	ge587ov12159 = (GE_ms("..", 2));
	ge949ov25346 = (GE_ms("gcaab", 5));
	ge949ov25342 = (GE_ms("GCAAB", 5));
	ge949ov25338 = (GE_ms("[$1] cluster $2: cannot read Eiffel file \'$3\'.", 46));
	ge956ov25354 = (GE_ms("gssss", 5));
	ge956ov25353 = (GE_ms("Syntax error:\n$1", 16));
	ge958ov25247 = (GE_ms("vscn0h", 6));
	ge958ov25021 = (GE_ms("VSCN", 4));
	ge958ov24869 = (GE_ms("built-in class cannot be overridden by class in file \'$8\'.", 58));
	ge958ov25249 = (GE_ms("vscn0j", 6));
	ge958ov24871 = (GE_ms("class in assembly \'$8\' cannot be overridden by class in file \'$10\'.", 67));
	ge958ov25242 = (GE_ms("vscn0c", 6));
	ge958ov24864 = (GE_ms("class appears in file \'$8\' and group \'$10\'.", 43));
	ge958ov25245 = (GE_ms("vscn0f", 6));
	ge958ov24867 = (GE_ms("built-in class also appears in file \'$8\'.", 41));
	ge958ov25241 = (GE_ms("vscn0b", 6));
	ge958ov24863 = (GE_ms("class appears in file \'$8\' and assembly \'$10\'.", 46));
	ge958ov25240 = (GE_ms("vscn0a", 6));
	ge958ov24862 = (GE_ms("class appears in files \'$8\' and \'$10\'.", 38));
	ge777ov14229 = (GE_ms("class", 5));
	ge777ov14096 = (GE_ms("*UNKNOWN*", 9));
	ge777ov14322 = (GE_ms("BOOLEAN_REF", 11));
	ge777ov14323 = (GE_ms("CHARACTER_REF", 13));
	ge777ov14324 = (GE_ms("CHARACTER_8_REF", 15));
	ge777ov14325 = (GE_ms("CHARACTER_32_REF", 16));
	ge777ov14326 = (GE_ms("COMPARABLE", 10));
	ge777ov14327 = (GE_ms("DOUBLE_REF", 10));
	ge777ov14328 = (GE_ms("HASHABLE", 8));
	ge777ov14329 = (GE_ms("INTEGER_REF", 11));
	ge777ov14330 = (GE_ms("INTEGER_8_REF", 13));
	ge777ov14331 = (GE_ms("INTEGER_16_REF", 14));
	ge777ov14332 = (GE_ms("INTEGER_32_REF", 14));
	ge777ov14333 = (GE_ms("INTEGER_64_REF", 14));
	ge777ov14334 = (GE_ms("NATURAL_REF", 11));
	ge777ov14335 = (GE_ms("NATURAL_8_REF", 13));
	ge777ov14336 = (GE_ms("NATURAL_16_REF", 14));
	ge777ov14337 = (GE_ms("NATURAL_32_REF", 14));
	ge777ov14338 = (GE_ms("NATURAL_64_REF", 14));
	ge777ov14339 = (GE_ms("NUMERIC", 7));
	ge777ov14340 = (GE_ms("PART_COMPARABLE", 15));
	ge777ov14341 = (GE_ms("POINTER_REF", 11));
	ge777ov14342 = (GE_ms("REAL_REF", 8));
	ge777ov14343 = (GE_ms("REAL_32_REF", 11));
	ge777ov14344 = (GE_ms("REAL_64_REF", 11));
	ge777ov14345 = (GE_ms("WIDE_CHARACTER_REF", 18));
	ge777ov14387 = (GE_ms("built_in", 8));
	ge777ov14388 = (GE_ms("static built_in", 15));
	ge777ov14389 = (GE_ms("built_in static", 15));
	ge777ov14054 = (GE_ms("ARGUMENTS", 9));
	ge777ov14055 = (GE_ms("ARRAY", 5));
	ge777ov14056 = (GE_ms("BIT", 3));
	ge777ov14057 = (GE_ms("BOOLEAN", 7));
	ge777ov14059 = (GE_ms("CHARACTER_8", 11));
	ge777ov14060 = (GE_ms("CHARACTER_32", 12));
	ge777ov14062 = (GE_ms("FUNCTION", 8));
	ge777ov14063 = (GE_ms("GENERAL", 7));
	ge777ov14064 = (GE_ms("IDENTIFIED_ROUTINES", 19));
	ge777ov14066 = (GE_ms("INTEGER_8", 9));
	ge777ov14067 = (GE_ms("INTEGER_16", 10));
	ge777ov14068 = (GE_ms("INTEGER_32", 10));
	ge777ov14069 = (GE_ms("INTEGER_64", 10));
	ge777ov14071 = (GE_ms("NATIVE_ARRAY", 12));
	ge777ov14073 = (GE_ms("NATURAL_8", 9));
	ge777ov14074 = (GE_ms("NATURAL_16", 10));
	ge777ov14075 = (GE_ms("NATURAL_32", 10));
	ge777ov14076 = (GE_ms("NATURAL_64", 10));
	ge777ov14077 = (GE_ms("NONE", 4));
	ge777ov14078 = (GE_ms("PLATFORM", 8));
	ge777ov14079 = (GE_ms("POINTER", 7));
	ge777ov14080 = (GE_ms("PREDICATE", 9));
	ge777ov14081 = (GE_ms("PROCEDURE", 9));
	ge777ov14083 = (GE_ms("REAL_32", 7));
	ge777ov14084 = (GE_ms("REAL_64", 7));
	ge777ov14085 = (GE_ms("ROUTINE", 7));
	ge777ov14086 = (GE_ms("SPECIAL", 7));
	ge777ov14087 = (GE_ms("STRING", 6));
	ge777ov14088 = (GE_ms("STRING_8", 8));
	ge777ov14089 = (GE_ms("STRING_32", 9));
	ge777ov14090 = (GE_ms("SYSTEM_OBJECT", 13));
	ge777ov14091 = (GE_ms("SYSTEM_STRING", 13));
	ge777ov14093 = (GE_ms("TYPE", 4));
	ge777ov14094 = (GE_ms("TYPED_POINTER", 13));
	ge777ov14097 = (GE_ms("aliased_resized_area", 20));
	ge777ov14099 = (GE_ms("argument", 8));
	ge777ov14100 = (GE_ms("argument_count", 14));
	ge777ov14105 = (GE_ms("as_natural_8", 12));
	ge777ov14106 = (GE_ms("as_natural_16", 13));
	ge777ov14107 = (GE_ms("as_natural_32", 13));
	ge777ov14108 = (GE_ms("as_natural_64", 13));
	ge777ov14101 = (GE_ms("as_integer_8", 12));
	ge777ov14102 = (GE_ms("as_integer_16", 13));
	ge777ov14103 = (GE_ms("as_integer_32", 13));
	ge777ov14104 = (GE_ms("as_integer_64", 13));
	ge777ov14109 = (GE_ms("bit_and", 7));
	ge777ov14110 = (GE_ms("bit_not", 7));
	ge777ov14111 = (GE_ms("bit_or", 6));
	ge777ov14112 = (GE_ms("bit_shift_left", 14));
	ge777ov14113 = (GE_ms("bit_shift_right", 15));
	ge777ov14114 = (GE_ms("bit_xor", 7));
	ge777ov14115 = (GE_ms("boolean_bytes", 13));
	ge777ov14116 = (GE_ms("boolean_item", 12));
	ge777ov14118 = (GE_ms("ceiling_real_32", 15));
	ge777ov14119 = (GE_ms("ceiling_real_64", 15));
	ge777ov14120 = (GE_ms("character_8_item", 16));
	ge777ov14121 = (GE_ms("character_32_item", 17));
	ge777ov14122 = (GE_ms("character_bytes", 15));
	ge777ov14124 = (GE_ms("code", 4));
	ge777ov14125 = (GE_ms("conforms_to", 11));
	ge777ov14126 = (GE_ms("copy", 4));
	ge777ov14128 = (GE_ms("deep_twin", 9));
	ge777ov14130 = (GE_ms("eif_id_object", 13));
	ge777ov14131 = (GE_ms("eif_object_id", 13));
	ge777ov14132 = (GE_ms("eif_object_id_free", 18));
	ge777ov14133 = (GE_ms("element_size", 12));
	ge777ov14135 = (GE_ms("floor_real_32", 13));
	ge777ov14136 = (GE_ms("floor_real_64", 13));
	ge777ov14137 = (GE_ms("generating_type", 15));
	ge777ov14138 = (GE_ms("generator", 9));
	ge777ov14139 = (GE_ms("generic_parameter", 17));
	ge777ov14140 = (GE_ms("generic_parameter_count", 23));
	ge777ov14141 = (GE_ms("hash_code", 9));
	ge777ov14142 = (GE_ms("integer_8_item", 14));
	ge777ov14143 = (GE_ms("integer_16_item", 15));
	ge777ov14144 = (GE_ms("integer_32_item", 15));
	ge777ov14145 = (GE_ms("integer_64_item", 15));
	ge777ov14146 = (GE_ms("integer_bytes", 13));
	ge777ov14147 = (GE_ms("is_deep_equal", 13));
	ge777ov14148 = (GE_ms("is_dotnet", 9));
	ge777ov14150 = (GE_ms("is_thread_capable", 17));
	ge777ov14151 = (GE_ms("is_unix", 7));
	ge777ov14152 = (GE_ms("is_vms", 6));
	ge777ov14153 = (GE_ms("is_windows", 10));
	ge777ov14155 = (GE_ms("item_code", 9));
	ge777ov14156 = (GE_ms("last_result", 11));
	ge777ov14158 = (GE_ms("make", 4));
	ge777ov14159 = (GE_ms("name", 4));
	ge777ov14160 = (GE_ms("natural_8_item", 14));
	ge777ov14161 = (GE_ms("natural_16_item", 15));
	ge777ov14162 = (GE_ms("natural_32_code", 15));
	ge777ov14163 = (GE_ms("natural_32_item", 15));
	ge777ov14164 = (GE_ms("natural_64_item", 15));
	ge777ov14165 = (GE_ms("object_comparison", 17));
	ge777ov14166 = (GE_ms("out", 3));
	ge777ov14167 = (GE_ms("pointer_bytes", 13));
	ge777ov14169 = (GE_ms("put", 3));
	ge777ov14170 = (GE_ms("put_boolean", 11));
	ge777ov14171 = (GE_ms("put_character_8", 15));
	ge777ov14172 = (GE_ms("put_character_32", 16));
	ge777ov14173 = (GE_ms("put_integer_8", 13));
	ge777ov14174 = (GE_ms("put_integer_16", 14));
	ge777ov14175 = (GE_ms("put_integer_32", 14));
	ge777ov14176 = (GE_ms("put_integer_64", 14));
	ge777ov14177 = (GE_ms("put_natural_8", 13));
	ge777ov14178 = (GE_ms("put_natural_16", 14));
	ge777ov14179 = (GE_ms("put_natural_32", 14));
	ge777ov14180 = (GE_ms("put_natural_64", 14));
	ge777ov14181 = (GE_ms("put_pointer", 11));
	ge777ov14182 = (GE_ms("put_real_32", 11));
	ge777ov14183 = (GE_ms("put_real_64", 11));
	ge777ov14184 = (GE_ms("put_reference", 13));
	ge777ov14185 = (GE_ms("real_32_item", 12));
	ge777ov14186 = (GE_ms("real_64_item", 12));
	ge777ov14187 = (GE_ms("real_bytes", 10));
	ge777ov14188 = (GE_ms("reference_item", 14));
	ge777ov14189 = (GE_ms("same_type", 9));
	ge777ov14190 = (GE_ms("set_item", 8));
	ge777ov14191 = (GE_ms("set_object_comparison", 21));
	ge777ov14192 = (GE_ms("set_operands", 12));
	ge777ov14193 = (GE_ms("standard_copy", 13));
	ge777ov14194 = (GE_ms("standard_is_equal", 17));
	ge777ov14195 = (GE_ms("standard_twin", 13));
	ge777ov14196 = (GE_ms("tagged_out", 10));
	ge777ov14197 = (GE_ms("to_character", 12));
	ge777ov14198 = (GE_ms("to_character_8", 14));
	ge777ov14199 = (GE_ms("to_character_32", 15));
	ge777ov14200 = (GE_ms("to_double", 9));
	ge777ov14201 = (GE_ms("to_integer_32", 13));
	ge777ov14203 = (GE_ms("to_real", 7));
	ge777ov14204 = (GE_ms("to_real_32", 10));
	ge777ov14205 = (GE_ms("to_real_64", 10));
	ge777ov14206 = (GE_ms("truncated_to_integer", 20));
	ge777ov14207 = (GE_ms("truncated_to_integer_64", 23));
	ge777ov14208 = (GE_ms("truncated_to_real", 17));
	ge777ov14209 = (GE_ms("twin", 4));
	ge777ov14210 = (GE_ms("type_id", 7));
	ge777ov14212 = (GE_ms("wide_character_bytes", 20));
	ge777ov14214 = (GE_ms("False", 5));
	ge777ov14215 = (GE_ms("Precursor", 9));
	ge777ov14217 = (GE_ms("True", 4));
	ge777ov14218 = (GE_ms("Void", 4));
	ge777ov14219 = (GE_ms("Unique", 6));
	ge777ov14220 = (GE_ms("agent", 5));
	ge777ov14221 = (GE_ms("alias", 5));
	ge777ov14222 = (GE_ms("all", 3));
	ge777ov14223 = (GE_ms("and", 3));
	ge777ov14225 = (GE_ms("as", 2));
	ge777ov14226 = (GE_ms("assign", 6));
	ge777ov14227 = (GE_ms("attribute", 9));
	ge777ov14228 = (GE_ms("check", 5));
	ge777ov14230 = (GE_ms("convert", 7));
	ge777ov14231 = (GE_ms("create", 6));
	ge777ov14232 = (GE_ms("creation", 8));
	ge777ov14233 = (GE_ms("current", 7));
	ge777ov14234 = (GE_ms("debug", 5));
	ge777ov14236 = (GE_ms("do", 2));
	ge777ov14237 = (GE_ms("else", 4));
	ge777ov14238 = (GE_ms("elseif", 6));
	ge777ov14240 = (GE_ms("ensure", 6));
	ge777ov14241 = (GE_ms("expanded", 8));
	ge777ov14242 = (GE_ms("export", 6));
	ge777ov14243 = (GE_ms("external", 8));
	ge777ov14244 = (GE_ms("false", 5));
	ge777ov14245 = (GE_ms("feature", 7));
	ge777ov14246 = (GE_ms("from", 4));
	ge777ov14247 = (GE_ms("frozen", 6));
	ge777ov14248 = (GE_ms("if", 2));
	ge777ov14249 = (GE_ms("implies", 7));
	ge777ov14250 = (GE_ms("indexing", 8));
	ge777ov14251 = (GE_ms("infix", 5));
	ge777ov14252 = (GE_ms("inherit", 7));
	ge777ov14253 = (GE_ms("inspect", 7));
	ge777ov14254 = (GE_ms("invariant", 9));
	ge777ov14255 = (GE_ms("is", 2));
	ge777ov14256 = (GE_ms("like", 4));
	ge777ov14257 = (GE_ms("local", 5));
	ge777ov14258 = (GE_ms("loop", 4));
	ge777ov14259 = (GE_ms("not", 3));
	ge777ov14260 = (GE_ms("obsolete", 8));
	ge777ov14261 = (GE_ms("old", 3));
	ge777ov14262 = (GE_ms("once", 4));
	ge777ov14263 = (GE_ms("or", 2));
	ge777ov14265 = (GE_ms("precursor", 9));
	ge777ov14266 = (GE_ms("prefix", 6));
	ge777ov14267 = (GE_ms("redefine", 8));
	ge777ov14268 = (GE_ms("recast", 6));
	ge777ov14269 = (GE_ms("reference", 9));
	ge777ov14270 = (GE_ms("rename", 6));
	ge777ov14271 = (GE_ms("require", 7));
	ge777ov14272 = (GE_ms("rescue", 6));
	ge777ov14273 = (GE_ms("result", 6));
	ge777ov14274 = (GE_ms("retry", 5));
	ge777ov14275 = (GE_ms("select", 6));
	ge777ov14276 = (GE_ms("separate", 8));
	ge777ov14277 = (GE_ms("strip", 5));
	ge777ov14278 = (GE_ms("then", 4));
	ge777ov14279 = (GE_ms("true", 4));
	ge777ov14280 = (GE_ms("undefine", 8));
	ge777ov14281 = (GE_ms("unique", 6));
	ge777ov14282 = (GE_ms("until", 5));
	ge777ov14283 = (GE_ms("variant", 7));
	ge777ov14284 = (GE_ms("void", 4));
	ge777ov14285 = (GE_ms("when", 4));
	ge777ov14286 = (GE_ms("xor", 3));
	ge777ov14287 = (GE_ms("->", 2));
	ge777ov14288 = (GE_ms(":=", 2));
	ge777ov14289 = (GE_ms("\?=", 2));
	ge777ov14290 = (GE_ms("@", 1));
	ge777ov14291 = (GE_ms("!", 1));
	ge777ov14292 = (GE_ms(":", 1));
	ge777ov14293 = (GE_ms(",", 1));
	ge777ov14294 = (GE_ms("//", 2));
	ge777ov14295 = (GE_ms("/", 1));
	ge777ov14296 = (GE_ms("$", 1));
	ge777ov14297 = (GE_ms(".", 1));
	ge777ov14298 = (GE_ms("..", 2));
	ge777ov14299 = (GE_ms("=", 1));
	ge777ov14300 = (GE_ms(">=", 2));
	ge777ov14301 = (GE_ms(">", 1));
	ge777ov14302 = (GE_ms("<=", 2));
	ge777ov14303 = (GE_ms("<<", 2));
	ge777ov14304 = (GE_ms("{", 1));
	ge777ov14305 = (GE_ms("[", 1));
	ge777ov14306 = (GE_ms("(", 1));
	ge777ov14307 = (GE_ms("<", 1));
	ge777ov14308 = (GE_ms("-", 1));
	ge777ov14309 = (GE_ms("\\\\", 2));
	ge777ov14310 = (GE_ms("/=", 2));
	ge777ov14311 = (GE_ms("+", 1));
	ge777ov14312 = (GE_ms("^", 1));
	ge777ov14313 = (GE_ms("\?", 1));
	ge777ov14314 = (GE_ms(">>", 2));
	ge777ov14315 = (GE_ms("}", 1));
	ge777ov14316 = (GE_ms("]", 1));
	ge777ov14317 = (GE_ms(")", 1));
	ge777ov14318 = (GE_ms(";", 1));
	ge777ov14319 = (GE_ms("~", 1));
	ge777ov14320 = (GE_ms("*", 1));
	ge286ov12084 = (GE_ms("", 0));
	ge386ov21045 = (GE_ms("se", 2));
	ge386ov21042 = (GE_ms("ge", 2));
	ge970ov15894 = (GE_ms("dummy", 5));
	ge384ov20937 = (GE_ms("", 0));
	ge958ov25258 = (GE_ms("vtbt0d", 6));
	ge958ov25024 = (GE_ms("VTBT", 4));
	ge958ov24880 = (GE_ms("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge958ov25257 = (GE_ms("vtbt0c", 6));
	ge958ov24879 = (GE_ms("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge958ov25289 = (GE_ms("gvkbu1a", 7));
	ge958ov25047 = (GE_ms("GVKBU-1", 7));
	ge958ov24911 = (GE_ms("unknown built-in routine `$7\' in class $5.", 42));
	ge958ov25288 = (GE_ms("gvkbs0a", 7));
	ge958ov25046 = (GE_ms("GVKBS", 5));
	ge958ov24910 = (GE_ms("built-in routine `$7\' in class $5 has not the expected signature \'$8\'.", 70));
	ge777ov14264 = (GE_ms("or else", 7));
	ge777ov14224 = (GE_ms("and then", 8));
	ge958ov25294 = (GE_ms("gvkfe5a", 7));
	ge958ov25052 = (GE_ms("GVKFE-5", 7));
	ge958ov24916 = (GE_ms("feature `$7\' in kernel class $5 is not a query.", 47));
	ge958ov25293 = (GE_ms("gvkfe4a", 7));
	ge958ov25051 = (GE_ms("GVKFE-4", 7));
	ge958ov24915 = (GE_ms("feature `$7\' in kernel class $5 is not a procedure.", 51));
	ge1288ov10793 = (GE_ms("undefined", 9));
	ge1288ov10792 = (GE_ms("(TRUNCATED)", 11));
	ge1015ov4342 = (GE_ms("abstract", 8));
	ge1015ov4343 = (GE_ms("address_expression", 18));
	ge1015ov4344 = (GE_ms("arguments", 9));
	ge1015ov4345 = (GE_ms("array_optimization", 18));
	ge1015ov4346 = (GE_ms("assembly", 8));
	ge1015ov4347 = (GE_ms("assertion", 9));
	ge1015ov4348 = (GE_ms("automatic_backup", 16));
	ge1015ov4349 = (GE_ms("callback", 8));
	ge1015ov4350 = (GE_ms("case_insensitive", 16));
	ge1015ov4351 = (GE_ms("check_generic_creation_constraint", 33));
	ge1015ov4352 = (GE_ms("check_vape", 10));
	ge1015ov4353 = (GE_ms("clean", 5));
	ge1015ov4354 = (GE_ms("cls_compliant", 13));
	ge1015ov4355 = (GE_ms("component", 9));
	ge1015ov4356 = (GE_ms("console_application", 19));
	ge1015ov4357 = (GE_ms("create_keyword_extension", 24));
	ge1015ov4358 = (GE_ms("culture", 7));
	ge1015ov4359 = (GE_ms("c_compiler_options", 18));
	ge1015ov4360 = (GE_ms("dead_code_removal", 17));
	ge1015ov4361 = (GE_ms("debug", 5));
	ge1015ov4362 = (GE_ms("debug_tag", 9));
	ge1015ov4363 = (GE_ms("debugger", 8));
	ge1015ov4364 = (GE_ms("document", 8));
	ge1015ov4365 = (GE_ms("dotnet_naming_convention", 24));
	ge1015ov4366 = (GE_ms("dynamic_runtime", 15));
	ge1015ov4367 = (GE_ms("ecf_library", 11));
	ge1015ov4368 = (GE_ms("enforce_unique_class_names", 26));
	ge1015ov4369 = (GE_ms("exception_trace", 15));
	ge1015ov4370 = (GE_ms("exclude", 7));
	ge1015ov4371 = (GE_ms("export", 6));
	ge1015ov4372 = (GE_ms("external_runtime", 16));
	ge1015ov4373 = (GE_ms("finalize", 8));
	ge1015ov4374 = (GE_ms("flat_fst_optimization", 21));
	ge1015ov4375 = (GE_ms("force_32bits", 12));
	ge1015ov4376 = (GE_ms("fst_expansion_factor", 20));
	ge1015ov4377 = (GE_ms("fst_optimization", 16));
	ge1015ov4378 = (GE_ms("full_class_checking", 19));
	ge1015ov4379 = (GE_ms("garbage_collector", 17));
	ge1015ov4380 = (GE_ms("gc_info", 7));
	ge1015ov4381 = (GE_ms("heap_size", 9));
	ge1015ov4382 = (GE_ms("header", 6));
	ge1015ov4383 = (GE_ms("high_memory_compiler", 20));
	ge1015ov4384 = (GE_ms("il_verifiable", 13));
	ge1015ov4385 = (GE_ms("include", 7));
	ge1015ov4386 = (GE_ms("inlining", 8));
	ge1015ov4387 = (GE_ms("inlining_size", 13));
	ge1015ov4388 = (GE_ms("jumps_optimization", 18));
	ge1015ov4389 = (GE_ms("layout", 6));
	ge1015ov4390 = (GE_ms("layout_optimization", 19));
	ge1015ov4391 = (GE_ms("leaves_optimization", 19));
	ge1015ov4392 = (GE_ms("line_generation", 15));
	ge1015ov4393 = (GE_ms("link", 4));
	ge1015ov4394 = (GE_ms("linker", 6));
	ge1015ov4395 = (GE_ms("linux_fpu_double_precision", 26));
	ge1015ov4396 = (GE_ms("manifest_string_trace", 21));
	ge1015ov4397 = (GE_ms("map", 3));
	ge1015ov4398 = (GE_ms("metadata_cache_path", 19));
	ge1015ov4399 = (GE_ms("msil_assembly_compatibility", 27));
	ge1015ov4400 = (GE_ms("msil_classes_per_module", 23));
	ge1015ov4401 = (GE_ms("msil_clr_version", 16));
	ge1015ov4402 = (GE_ms("msil_culture", 12));
	ge1015ov4403 = (GE_ms("msil_generation", 15));
	ge1015ov4404 = (GE_ms("msil_generation_version", 23));
	ge1015ov4405 = (GE_ms("msil_key_file_name", 18));
	ge1015ov4406 = (GE_ms("msil_use_optimized_precompile", 29));
	ge1015ov4407 = (GE_ms("multithreaded", 13));
	ge1015ov4408 = (GE_ms("namespace", 9));
	ge1015ov4409 = (GE_ms("no_default_lib", 14));
	ge1015ov4410 = (GE_ms("old_verbatim_strings", 20));
	ge1015ov4411 = (GE_ms("override_cluster", 16));
	ge1015ov4412 = (GE_ms("portable_code_generation", 24));
	ge1015ov4413 = (GE_ms("precompiled", 11));
	ge1015ov4414 = (GE_ms("prefix", 6));
	ge1015ov4415 = (GE_ms("profile", 7));
	ge1015ov4416 = (GE_ms("public_key_token", 16));
	ge1015ov4417 = (GE_ms("read_only", 9));
	ge1015ov4418 = (GE_ms("recursive", 9));
	ge1015ov4419 = (GE_ms("reloads_optimization", 20));
	ge1015ov4420 = (GE_ms("shared_library_definition", 25));
	ge1015ov4421 = (GE_ms("split", 5));
	ge1015ov4422 = (GE_ms("stack_size", 10));
	ge1015ov4423 = (GE_ms("storable", 8));
	ge1015ov4424 = (GE_ms("storable_filename", 17));
	ge1015ov4425 = (GE_ms("strip", 5));
	ge1015ov4426 = (GE_ms("target", 6));
	ge1015ov4427 = (GE_ms("trace", 5));
	ge1015ov4428 = (GE_ms("use_cluster_name_as_namespace", 29));
	ge1015ov4429 = (GE_ms("use_full_cluster_name_as_namespace", 34));
	ge1015ov4430 = (GE_ms("verbose", 7));
	ge1015ov4431 = (GE_ms("version", 7));
	ge1015ov4432 = (GE_ms("visible_filename", 16));
	ge1015ov4433 = (GE_ms("warning", 7));
	ge1015ov4434 = (GE_ms("wedit", 5));
	ge1049ov4309 = (GE_ms("", 0));
	ge1015ov4552 = (GE_ms("require", 7));
	ge1015ov4539 = (GE_ms("ensure", 6));
	ge1015ov4544 = (GE_ms("invariant", 9));
	ge1015ov4545 = (GE_ms("loop_invariant", 14));
	ge1015ov4546 = (GE_ms("loop_variant", 12));
	ge1015ov4533 = (GE_ms("check", 5));
	ge1015ov4550 = (GE_ms("none", 4));
	ge1015ov4554 = (GE_ms("style", 5));
	ge1015ov4537 = (GE_ms("default", 7));
	ge1015ov4529 = (GE_ms("all", 3));
	ge1015ov4540 = (GE_ms("exe", 3));
	ge1015ov4538 = (GE_ms("dll", 3));
	ge1015ov4535 = (GE_ms("com", 3));
	ge1015ov4549 = (GE_ms("no_main", 7));
	ge1015ov4548 = (GE_ms("microsoft", 9));
	ge1015ov4531 = (GE_ms("auto", 4));
	ge1015ov4553 = (GE_ms("sequential", 10));
	ge1015ov4530 = (GE_ms("array", 5));
	ge1015ov4536 = (GE_ms("constant", 8));
	ge1015ov4551 = (GE_ms("once", 4));
	ge1015ov4543 = (GE_ms("internal", 8));
	ge1015ov4532 = (GE_ms("boehm", 5));
	ge1015ov4547 = (GE_ms("low_level", 9));
	ge1015ov4541 = (GE_ms("feature", 7));
	ge1015ov4534 = (GE_ms("class", 5));
	ge1015ov4557 = (GE_ms("winapi", 6));
	ge1015ov4542 = (GE_ms("generate", 8));
	ge1015ov4555 = (GE_ms("supplier_precondition", 21));
	ge1049ov4308 = (GE_ms("false", 5));
	ge1049ov4307 = (GE_ms("true", 4));
	ge1011ov18408 = (GE_ms("", 0));
	ge1295ov11330 = (GE_ms("PE reference only allowed in DTD", 32));
	ge1295ov11292 = (GE_ms("< not allowed in attribute value", 32));
	ge1295ov11290 = (GE_ms("-- not allowed in comment", 25));
	ge1295ov11331 = (GE_ms("xml prefix reserved in processing instruction", 45));
	ge1295ov11303 = (GE_ms("Misformed XML Declaration", 25));
	ge1295ov11302 = (GE_ms("Misplaced markup declaration", 28));
	ge1295ov11313 = (GE_ms("End tag does not match start tag", 32));
	ge1295ov11307 = (GE_ms("Missing element end tag", 23));
	ge1295ov11306 = (GE_ms("Error in element content", 24));
	ge1295ov11305 = (GE_ms("Misformed start tag", 19));
	ge1295ov11311 = (GE_ms("Attribute declared twice", 24));
	ge1295ov11310 = (GE_ms("Misformed attribute in tag", 26));
	ge1295ov11312 = (GE_ms("Error in end tag", 16));
	ge1295ov11289 = (GE_ms("]]> not allowed in content", 26));
	ge1295ov11315 = (GE_ms("Error in XML declaration", 24));
	ge1295ov11324 = (GE_ms("Misformed element type declaration", 34));
	ge1298ov11145 = (GE_ms("*", 1));
	ge1298ov11143 = (GE_ms("+", 1));
	ge1298ov11144 = (GE_ms("\?", 1));
	ge1295ov11325 = (GE_ms("Misformed attribute list declaration", 36));
	ge1295ov11326 = (GE_ms("Misformed attribute definition declaration", 42));
	ge1295ov11329 = (GE_ms("Misformed conditional section", 29));
	ge1295ov11327 = (GE_ms("Misformed entity declaration", 28));
	ge1295ov11328 = (GE_ms("Misformed entity notation", 25));
	ge1295ov11322 = (GE_ms("Parser is not configured to support external DTDs", 49));
	ge1291ov20599 = (GE_ms("1.0", 3));
	ge1291ov20600 = (GE_ms("utf-8", 5));
	ge1295ov11295 = (GE_ms("unsupported character encoding", 30));
	ge1295ov11318 = (GE_ms("External reference in quoted value", 34));
	ge1295ov11338 = (GE_ms("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1295ov11339 = (GE_ms("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1295ov11340 = (GE_ms("Invalid UTF8 character sequence", 31));
	ge1295ov11333 = (GE_ms("Name misformed", 14));
	ge1295ov11316 = (GE_ms("Literal entity expected in attribute", 36));
	ge1295ov11317 = (GE_ms("Entity is not defined", 21));
	ge1295ov11319 = (GE_ms("Entity cannot be recursively included", 37));
	ge1295ov11323 = (GE_ms("Undefined PE entity", 19));
	ge61ov3996 = (GE_ms("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge61ov4003 = (GE_ms("APIPAR", 6));
	ge59ov4244 = (GE_ms("usage: ", 7));
	ge320ov1718 = (GE_ms("3.7", 3));
	ge58ov3479 = (GE_ms("Errors parsing arguments, aborting.", 35));
	ge61ov3999 = (GE_ms("Too many occurrences of option \'$1\'.", 36));
	ge61ov4006 = (GE_ms("APSOPT", 6));
	ge61ov3997 = (GE_ms("The mandatory option \'$1\' is missing.", 37));
	ge61ov4004 = (GE_ms("APMOPT", 6));
	ge61ov3998 = (GE_ms("The option \'$1\' is missing a parameter.", 39));
	ge61ov4005 = (GE_ms("APMPAR", 6));
	ge61ov4000 = (GE_ms("Unknown option \'$1\'.", 20));
	ge61ov4007 = (GE_ms("APUOPT", 6));
	ge61ov4001 = (GE_ms("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge61ov4008 = (GE_ms("APUPAR", 6));
	ge58ov3474 = (GE_ms("help", 4));
	ge58ov3473 = (GE_ms("Display this help text.", 23));
	ge58ov3481 = (GE_ms("parameters ...", 14));
	ge58ov3480 = (GE_ms("", 0));
	ge1302ov20309 = (GE_ms(" ", 1));
	ge1302ov20310 = (GE_ms("  ", 2));
	ge1293ov25478 = (GE_ms("iso-8859-1", 10));
	ge1293ov25480 = (GE_ms("utf-16", 6));
	ge958ov25272 = (GE_ms("vuar2b", 6));
	ge958ov25032 = (GE_ms("VUAR-2", 6));
	ge958ov24894 = (GE_ms("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge958ov25271 = (GE_ms("vuar2a", 6));
	ge958ov24893 = (GE_ms("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge958ov25095 = (GE_ms("vdpr4b", 6));
	ge958ov24944 = (GE_ms("VDPR-4B", 7));
	ge958ov24717 = (GE_ms("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$7\' in class $8.", 140));
	ge958ov25269 = (GE_ms("vuar1b", 6));
	ge958ov25031 = (GE_ms("VUAR-1", 6));
	ge958ov24891 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge958ov25268 = (GE_ms("vuar1a", 6));
	ge958ov24890 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge958ov25094 = (GE_ms("vdpr4a", 6));
	ge958ov24943 = (GE_ms("VDPR-4A", 7));
	ge958ov24716 = (GE_ms("the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$7\' in class $8.", 127));
	ge958ov25062 = (GE_ms("vape0b", 6));
	ge958ov24929 = (GE_ms("VAPE", 4));
	ge958ov24684 = (GE_ms("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge958ov25061 = (GE_ms("vape0a", 6));
	ge958ov24683 = (GE_ms("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge958ov25274 = (GE_ms("vuex1a", 6));
	ge958ov25034 = (GE_ms("VUEX-1", 6));
	ge958ov24896 = (GE_ms("`$7\' is not the final name of a feature in class $5.", 52));
	ge958ov25299 = (GE_ms("gvual0a", 7));
	ge958ov25055 = (GE_ms("GVUAL", 5));
	ge958ov24921 = (GE_ms("`$7\' is a local variable of feature `$8\' and hence cannot have actual arguments.", 80));
	ge958ov25300 = (GE_ms("gvual0b", 7));
	ge958ov24922 = (GE_ms("`$7\' is a local variable of an inline agent and hence cannot have actual arguments.", 83));
	ge958ov25297 = (GE_ms("gvuaa0a", 7));
	ge958ov25054 = (GE_ms("GVUAA", 5));
	ge958ov24919 = (GE_ms("`$7\' is a formal argument of feature `$8\' and hence cannot have actual arguments.", 81));
	ge958ov25298 = (GE_ms("gvuaa0b", 7));
	ge958ov24920 = (GE_ms("`$7\' is a formal argument of an inline agent and hence cannot have actual arguments.", 84));
	ge958ov25190 = (GE_ms("vkcn2c", 6));
	ge958ov24989 = (GE_ms("VKCN-2", 6));
	ge958ov24812 = (GE_ms("procedure `$8\' appears in a call expression.", 44));
	ge958ov25303 = (GE_ms("gvuil0a", 7));
	ge958ov25057 = (GE_ms("GVUIL", 5));
	ge958ov24925 = (GE_ms("`$7\' is a local variable of feature `$8\' and hence cannot be an instruction.", 76));
	ge958ov25304 = (GE_ms("gvuil0b", 7));
	ge958ov24926 = (GE_ms("`$7\' is a local variable of an inline agent and hence cannot be an instruction.", 79));
	ge958ov25301 = (GE_ms("gvuia0a", 7));
	ge958ov25056 = (GE_ms("GVUIA", 5));
	ge958ov24923 = (GE_ms("`$7\' is a formal argument of feature `$8\' and hence cannot be an instruction.", 77));
	ge958ov25302 = (GE_ms("gvuia0b", 7));
	ge958ov24924 = (GE_ms("`$7\' is a formal argument of an inline agent and hence cannot be an instruction.", 80));
	ge958ov25188 = (GE_ms("vkcn1c", 6));
	ge958ov24988 = (GE_ms("VKCN-1", 6));
	ge958ov24810 = (GE_ms("query `$8\' appears in a call instruction.", 41));
	ge958ov25126 = (GE_ms("veen2c", 6));
	ge958ov24960 = (GE_ms("VEEN-2", 6));
	ge958ov24748 = (GE_ms("local entity `$7\' appears in the precondition or postcondition of feature `$8\'.", 79));
	ge958ov25128 = (GE_ms("veen2e", 6));
	ge958ov24750 = (GE_ms("local entity `$7\' appears in the precondition or postcondition of an inline agent.", 82));
	ge958ov25064 = (GE_ms("vape0d", 6));
	ge958ov24686 = (GE_ms("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge958ov25063 = (GE_ms("vape0c", 6));
	ge958ov24685 = (GE_ms("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge958ov25276 = (GE_ms("vuex2b", 6));
	ge958ov25035 = (GE_ms("VUEX-2", 6));
	ge958ov24898 = (GE_ms("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge958ov25270 = (GE_ms("vuar1c", 6));
	ge958ov24892 = (GE_ms("call to Tuple label `$7\' cannot have arguments.", 47));
	ge958ov25275 = (GE_ms("vuex2a", 6));
	ge958ov24897 = (GE_ms("`$7\' is not the final name of a feature in class $8.", 52));
	ge958ov25189 = (GE_ms("vkcn2a", 6));
	ge958ov24811 = (GE_ms("procedure `$8\' of class $9 appears in a call expression.", 56));
	ge958ov25124 = (GE_ms("veen2a", 6));
	ge958ov24746 = (GE_ms("entity \'Result\' appears in the body, postcondition or rescue clause of a procedure `$7\'.", 88));
	ge958ov25130 = (GE_ms("veen2g", 6));
	ge958ov24752 = (GE_ms("entity \'Result\' appears in the body, postcondition or rescue clause of an inline agent whose associated feature is a procedure.", 127));
	ge958ov25127 = (GE_ms("veen2d", 6));
	ge958ov24749 = (GE_ms("entity \'Result\' appears in the invariant of the class.", 54));
	ge958ov25125 = (GE_ms("veen2b", 6));
	ge958ov24747 = (GE_ms("entity \'Result\' appears in the precondition of feature `$7\'.", 60));
	ge958ov25170 = (GE_ms("vhpr1a", 6));
	ge958ov24971 = (GE_ms("VHPR-1", 6));
	ge958ov24792 = (GE_ms("inheritance cycle $7.", 21));
	ge958ov25080 = (GE_ms("vcfg3j", 6));
	ge958ov24937 = (GE_ms("VCFG-3", 6));
	ge958ov24702 = (GE_ms("formal generic constraint cycle $7.", 35));
	ge958ov25078 = (GE_ms("vcfg3g", 6));
	ge958ov24700 = (GE_ms("formal generic constraint cycle $7.", 35));
	ge958ov25072 = (GE_ms("vcfg2a", 6));
	ge958ov24936 = (GE_ms("VCFG-2", 6));
	ge958ov24694 = (GE_ms("\'$7\' is the name of formal generic parameters #$7 and #$8.", 58));
	ge958ov25071 = (GE_ms("vcfg1a", 6));
	ge958ov24935 = (GE_ms("VCFG-1", 6));
	ge958ov24693 = (GE_ms("formal generic parameter \'$7\' has the same name as a class in the surrounding universe.", 87));
	ge958ov25283 = (GE_ms("gvagp0a", 7));
	ge958ov25041 = (GE_ms("GVAGP", 5));
	ge958ov24905 = (GE_ms("ancestors with generic parameter mismatch: \'$7\' and \'$8\'.", 57));
	ge958ov25287 = (GE_ms("gvhso2a", 7));
	ge958ov25045 = (GE_ms("GVHSO-2", 7));
	ge958ov24909 = (GE_ms("implicitly inherits from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.", 83));
	ge958ov25262 = (GE_ms("vtct0a", 6));
	ge958ov25027 = (GE_ms("VTCT", 4));
	ge958ov24884 = (GE_ms("type based on unknown class $7.", 31));
	ge958ov25286 = (GE_ms("gvhso1a", 7));
	ge958ov25044 = (GE_ms("GVHSO-1", 7));
	ge958ov24908 = (GE_ms("implicitly inherits from unknown class SYSTEM_OBJECT.", 53));
	ge958ov25169 = (GE_ms("vhay0a", 6));
	ge958ov24979 = (GE_ms("VHAY", 4));
	ge958ov24791 = (GE_ms("implicitly inherits from unknown class ANY.", 43));
	ge958ov25171 = (GE_ms("vhpr1b", 6));
	ge958ov24793 = (GE_ms("inheritance cycle when inheriting from $7.", 42));
	ge958ov25277 = (GE_ms("vwbe0a", 6));
	ge958ov25036 = (GE_ms("VWBE", 4));
	ge958ov24899 = (GE_ms("boolean expression of non-BOOLEAN type \'$7\'.", 44));
	ge958ov25264 = (GE_ms("vtgc0a", 6));
	ge958ov25028 = (GE_ms("VTGC", 4));
	ge958ov24886 = (GE_ms("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge958ov25265 = (GE_ms("vtgc0b", 6));
	ge958ov24887 = (GE_ms("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge958ov25168 = (GE_ms("vgcp3c", 6));
	ge958ov24978 = (GE_ms("VGCP-3", 6));
	ge958ov24790 = (GE_ms("procedure name `$7\' appears twice in creation clause of constraint.", 67));
	ge958ov25164 = (GE_ms("vgcp2a", 6));
	ge958ov24977 = (GE_ms("VGCP-2", 6));
	ge958ov24786 = (GE_ms("`$7\' is not the final name of a procedure.", 42));
	ge958ov25165 = (GE_ms("vgcp2b", 6));
	ge958ov24787 = (GE_ms("`$7\' is not the final name of a procedure.", 42));
	ge958ov25156 = (GE_ms("vgcc6a", 6));
	ge958ov24974 = (GE_ms("VGCC-6", 6));
	ge958ov24778 = (GE_ms("`$7\' is the final name of a once-procedure.", 43));
	ge958ov25167 = (GE_ms("vgcp3b", 6));
	ge958ov24789 = (GE_ms("procedure name `$7\' appears in two different creation clauses.", 62));
	ge958ov25166 = (GE_ms("vgcp3a", 6));
	ge958ov24788 = (GE_ms("procedure name `$7\' appears twice in creation clause.", 53));
	ge958ov25163 = (GE_ms("vgcp1a", 6));
	ge958ov24976 = (GE_ms("VGCP-1", 6));
	ge958ov24785 = (GE_ms("deferred class has a creation clause.", 37));
	ge958ov25135 = (GE_ms("vfac4a", 6));
	ge958ov24964 = (GE_ms("VFAC-4", 6));
	ge958ov24757 = (GE_ms("the type of the $10-th argument of assigner procedure `$8\' and of the $9-th argument of query `$7\' do not have the same deanchored form.", 136));
	ge958ov25134 = (GE_ms("vfac3a", 6));
	ge958ov24963 = (GE_ms("VFAC-3", 6));
	ge958ov24756 = (GE_ms("the type of the first argument of assigner procedure `$8\' and the result type of query `$7\' do not have the same deanchored form.", 129));
	ge958ov25133 = (GE_ms("vfac2a", 6));
	ge958ov24962 = (GE_ms("VFAC-2", 6));
	ge958ov24755 = (GE_ms("the number of arguments in assigner procedure `$8\' is not one more than the number of arguments in query `$7\'.", 110));
	ge958ov25132 = (GE_ms("vfac1b", 6));
	ge958ov24961 = (GE_ms("VFAC-1", 6));
	ge958ov24754 = (GE_ms("query `$7\' has an assigner mark `$8\' but this feature is not a procedure.", 73));
	ge958ov25131 = (GE_ms("vfac1a", 6));
	ge958ov24753 = (GE_ms("query `$7\' has an assigner mark `$8\' but there is no feature with that name.", 76));
	ge958ov25070 = (GE_ms("vcch2a", 6));
	ge958ov24934 = (GE_ms("VCCH-2", 6));
	ge958ov24692 = (GE_ms("class is marked as deferred but has no deferred feature.", 56));
	ge958ov25068 = (GE_ms("vcch1a", 6));
	ge958ov24933 = (GE_ms("VCCH-1", 6));
	ge958ov24690 = (GE_ms("class is not marked as deferred but has deferred feature `$7\'.", 62));
	ge958ov25098 = (GE_ms("vdrd2c", 6));
	ge958ov24945 = (GE_ms("VDRD-2", 6));
	ge958ov24720 = (GE_ms("signature of selected feature `$7\' does not conform to the signature of replicated feature `$8\' in parent $9.", 109));
	ge958ov25099 = (GE_ms("vdrd2d", 6));
	ge958ov24721 = (GE_ms("signature of selected feature `$7\' inherited from $8 does not conform to the signature of replicated feature `$9\' in parent $10.", 128));
	ge958ov25082 = (GE_ms("vdjr0b", 6));
	ge958ov24938 = (GE_ms("VDJR", 4));
	ge958ov24704 = (GE_ms("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of argument number $10 differs.", 122));
	ge958ov25081 = (GE_ms("vdjr0a", 6));
	ge958ov24703 = (GE_ms("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Different number of arguments.", 116));
	ge958ov25083 = (GE_ms("vdjr0c", 6));
	ge958ov24705 = (GE_ms("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of result differs.", 109));
	ge958ov25107 = (GE_ms("vdrd6b", 6));
	ge958ov24949 = (GE_ms("VDRD-6", 6));
	ge958ov24729 = (GE_ms("attribute `$7\' inherited from $8 and its redeclared version don\'t have the same type expandedness.", 98));
	ge958ov25096 = (GE_ms("vdrd2a", 6));
	ge958ov24718 = (GE_ms("signature of feature `$7\' does not conform to the signature of redeclared feature `$8\' in parent $9.", 100));
	ge958ov25097 = (GE_ms("vdrd2b", 6));
	ge958ov24719 = (GE_ms("signature of feature `$7\' inherited from $8 does not conform to the signature of redeclared feature `$9\' in parent $10.", 119));
	ge958ov25141 = (GE_ms("vfav1f", 6));
	ge958ov24965 = (GE_ms("VFAV-1", 6));
	ge958ov24763 = (GE_ms("features `$7\' and `$9\' have both the same binary Operator alias `$8\'.", 69));
	ge958ov25138 = (GE_ms("vfav1c", 6));
	ge958ov24760 = (GE_ms("features `$7\' and `$9\' have both the same unary Operator alias `$8\'.", 68));
	ge958ov25145 = (GE_ms("vfav2b", 6));
	ge958ov24966 = (GE_ms("VFAV-2", 6));
	ge958ov24767 = (GE_ms("features `$7\' and `$9\' have both the same Bracket alias `$8\'.", 61));
	ge958ov25142 = (GE_ms("vfav1g", 6));
	ge958ov24764 = (GE_ms("features `$7\' and `$9\' inherited from $11 have both the same binary Operator alias `$8\'.", 88));
	ge958ov25139 = (GE_ms("vfav1d", 6));
	ge958ov24761 = (GE_ms("features `$7\' and `$9\' inherited from $11 have both the same unary Operator alias `$8\'.", 87));
	ge958ov25146 = (GE_ms("vfav2c", 6));
	ge958ov24768 = (GE_ms("features `$7\' and `$9\' inherited from $11 have both the same Bracket alias `$8\'.", 80));
	ge958ov25143 = (GE_ms("vfav1h", 6));
	ge958ov24765 = (GE_ms("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same binary Operator alias `$8\'.", 107));
	ge958ov25140 = (GE_ms("vfav1e", 6));
	ge958ov24762 = (GE_ms("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same unary Operator alias `$8\'.", 106));
	ge958ov25147 = (GE_ms("vfav2d", 6));
	ge958ov24769 = (GE_ms("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Bracket alias `$8\'.", 99));
	ge958ov25254 = (GE_ms("vtat2a", 6));
	ge958ov25023 = (GE_ms("VTAT-2", 6));
	ge958ov24876 = (GE_ms("anchor cycle $7.", 16));
	ge958ov25152 = (GE_ms("vffd7b", 6));
	ge958ov24970 = (GE_ms("VFFD-7", 6));
	ge958ov24774 = (GE_ms("feature `$7\' is a once funtion but its type contains a formal generic parameter.", 80));
	ge958ov25151 = (GE_ms("vffd7a", 6));
	ge958ov24773 = (GE_ms("feature `$7\' is a once funtion but its type contains an anchored type.", 70));
	ge958ov25137 = (GE_ms("vfav1b", 6));
	ge958ov24759 = (GE_ms("feature `$7\' has a unary Operator alias `$8\' but is not a query with no argument.", 81));
	ge958ov25136 = (GE_ms("vfav1a", 6));
	ge958ov24758 = (GE_ms("feature `$7\' has a binary Operator alias `$8\' but is not a query with at exactly one argument.", 94));
	ge958ov25144 = (GE_ms("vfav2a", 6));
	ge958ov24766 = (GE_ms("feature `$7\' has a Bracket alias `$8\' but is not a query with at least one argument.", 84));
	ge958ov25150 = (GE_ms("vffd6a", 6));
	ge958ov24969 = (GE_ms("VFFD-6", 6));
	ge958ov24772 = (GE_ms("feature `$7\' has an Infix name but is not a function with exactly one argument.", 79));
	ge958ov25149 = (GE_ms("vffd5a", 6));
	ge958ov24968 = (GE_ms("VFFD-5", 6));
	ge958ov24771 = (GE_ms("feature `$7\' has a Prefix name but is not an attribute or a function with no argument.", 86));
	ge958ov25148 = (GE_ms("vffd4a", 6));
	ge958ov24967 = (GE_ms("VFFD-4", 6));
	ge958ov24770 = (GE_ms("deferred feature `$7\' is marked as frozen.", 42));
	ge958ov25232 = (GE_ms("vrfa0a", 6));
	ge958ov25016 = (GE_ms("VRFA", 4));
	ge958ov24854 = (GE_ms("argument name \'$7\' in feature `$8\' is also the final name of a feature.", 71));
	ge958ov25230 = (GE_ms("vreg0a", 6));
	ge958ov25015 = (GE_ms("VREG", 4));
	ge958ov24852 = (GE_ms("argument name \'$7\' appear twice in feature `$8\'.", 48));
	ge958ov25085 = (GE_ms("vdjr2b", 6));
	ge958ov24939 = (GE_ms("VDJR-2", 6));
	ge958ov24707 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge958ov25198 = (GE_ms("vmfn2b", 6));
	ge958ov24994 = (GE_ms("VMFN-2", 6));
	ge958ov24820 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge958ov25084 = (GE_ms("vdjr2a", 6));
	ge958ov24706 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge958ov25197 = (GE_ms("vmfn2a", 6));
	ge958ov24819 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge958ov25196 = (GE_ms("vmfn0c", 6));
	ge958ov24993 = (GE_ms("VMFN", 4));
	ge958ov24818 = (GE_ms("two features with the same name `$7\' inherited from $8 and `$9\' inherited from $10.", 83));
	ge958ov25115 = (GE_ms("vdrs4a", 6));
	ge958ov24954 = (GE_ms("VDRS-4", 6));
	ge958ov24737 = (GE_ms("Redefine subclause of $8 lists feature `$7\' but it is not redefined.", 68));
	ge958ov25113 = (GE_ms("vdrs2b", 6));
	ge958ov24952 = (GE_ms("VDRS-2", 6));
	ge958ov24735 = (GE_ms("cannot redefine the constant attribute `$7\'.", 44));
	ge958ov25112 = (GE_ms("vdrs2a", 6));
	ge958ov24734 = (GE_ms("cannot redefine the frozen feature `$7\'.", 40));
	ge958ov25119 = (GE_ms("vdus2b", 6));
	ge958ov24956 = (GE_ms("VDUS-2", 6));
	ge958ov24741 = (GE_ms("cannot undefine the attribute `$7\'.", 35));
	ge958ov25118 = (GE_ms("vdus2a", 6));
	ge958ov24740 = (GE_ms("cannot undefine the frozen feature `$7\'.", 40));
	ge958ov25120 = (GE_ms("vdus3a", 6));
	ge958ov24957 = (GE_ms("VDUS-3", 6));
	ge958ov24742 = (GE_ms("cannot undefine the deferred feature `$7\'.", 42));
	ge958ov25180 = (GE_ms("vhrc4d", 6));
	ge958ov24983 = (GE_ms("VHRC-4", 6));
	ge958ov24802 = (GE_ms("`$7\' has a unary Operator alias `$8\' but `$9\' in $10 is not a query with no argument.", 85));
	ge958ov25179 = (GE_ms("vhrc4c", 6));
	ge958ov24801 = (GE_ms("`$7\' has a binary Operator alias `$8\' but `$9\' in $10 is not a query with exactly one argument.", 95));
	ge958ov25178 = (GE_ms("vhrc4b", 6));
	ge958ov24800 = (GE_ms("`$7\' has a Bracket alias `$8\' but `$9\' in $10 is not a query with at least one argument.", 88));
	ge958ov25177 = (GE_ms("vhrc4a", 6));
	ge958ov24799 = (GE_ms("`$7\' is of the Prefix form but `$8\' in $9 is not an attribute nor a function with no argument.", 94));
	ge958ov25181 = (GE_ms("vhrc5a", 6));
	ge958ov24984 = (GE_ms("VHRC-5", 6));
	ge958ov24803 = (GE_ms("`$7\' is of the Infix form but `$8\' in $9 is not a function with one argument.", 77));
	ge958ov25101 = (GE_ms("vdrd3b", 6));
	ge958ov24946 = (GE_ms("VDRD-3", 6));
	ge958ov24723 = (GE_ms("feature `$7\' is redeclared but its postconditions do not begin with \'ensure then\'.", 82));
	ge958ov25100 = (GE_ms("vdrd3a", 6));
	ge958ov24722 = (GE_ms("feature `$7\' is redeclared but its preconditions do not begin with \'require else\'.", 82));
	ge958ov25106 = (GE_ms("vdrd6a", 6));
	ge958ov24728 = (GE_ms("attribute `$7\' inherited from $8 is not redeclared into an attribute.", 69));
	ge958ov25103 = (GE_ms("vdrd4b", 6));
	ge958ov24947 = (GE_ms("VDRD-4", 6));
	ge958ov24725 = (GE_ms("effective feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 98));
	ge958ov25104 = (GE_ms("vdrd4c", 6));
	ge958ov24726 = (GE_ms("effective feature `$8\' inherited from $9 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses.", 132));
	ge958ov25195 = (GE_ms("vmfn0b", 6));
	ge958ov24817 = (GE_ms("two features with the same name `$7\' in current class and `$8\' inherited from $9.", 81));
	ge958ov25102 = (GE_ms("vdrd4a", 6));
	ge958ov24724 = (GE_ms("deferred feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 97));
	ge958ov25116 = (GE_ms("vdrs4b", 6));
	ge958ov24738 = (GE_ms("redeclaration of feature `$7\' from $8 is an effecting and should not appear in the Redefine subclause.", 102));
	ge958ov25105 = (GE_ms("vdrd5a", 6));
	ge958ov24948 = (GE_ms("VDRD-5", 6));
	ge958ov24727 = (GE_ms("effective feature `$7\' inherited from $8 is redefined into a deferred one.", 74));
	ge958ov25110 = (GE_ms("vdrd7c", 6));
	ge958ov24950 = (GE_ms("VDRD-7", 6));
	ge958ov24732 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has a different one `$11\'.", 102));
	ge958ov25108 = (GE_ms("vdrd7a", 6));
	ge958ov24730 = (GE_ms("feature `$7\' inherited from $8 has no alias but its redeclared version has one `$10\'.", 85));
	ge958ov25109 = (GE_ms("vdrd7b", 6));
	ge958ov24731 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has none.", 85));
	ge958ov25203 = (GE_ms("vmss3a", 6));
	ge958ov24998 = (GE_ms("VMSS-3", 6));
	ge958ov24825 = (GE_ms("feature name `$7\' appears in the Select subclause of parent $8 but is not replicated.", 85));
	ge958ov25199 = (GE_ms("vmrc2a", 6));
	ge958ov24995 = (GE_ms("VMRC-2", 6));
	ge958ov24821 = (GE_ms("replicated features $6 have not been selected.", 46));
	ge958ov25201 = (GE_ms("vmss1a", 6));
	ge958ov24996 = (GE_ms("VMSS-1", 6));
	ge958ov24823 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge958ov25111 = (GE_ms("vdrs1a", 6));
	ge958ov24951 = (GE_ms("VDRS-1", 6));
	ge958ov24733 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge958ov25117 = (GE_ms("vdus1a", 6));
	ge958ov24955 = (GE_ms("VDUS-1", 6));
	ge958ov24739 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge958ov25192 = (GE_ms("vlel2a", 6));
	ge958ov24991 = (GE_ms("VLEL-2", 6));
	ge958ov24814 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge958ov25175 = (GE_ms("vhrc1a", 6));
	ge958ov24981 = (GE_ms("VHRC-1", 6));
	ge958ov24797 = (GE_ms("`$7\' is not the final name of a feature in $8.", 46));
	ge958ov25202 = (GE_ms("vmss2a", 6));
	ge958ov24997 = (GE_ms("VMSS-2", 6));
	ge958ov24824 = (GE_ms("feature name `$7\' appears twice in the Select subclause of parent $8.", 69));
	ge958ov25114 = (GE_ms("vdrs3a", 6));
	ge958ov24953 = (GE_ms("VDRS-3", 6));
	ge958ov24736 = (GE_ms("feature name `$7\' appears twice in the Redefine subclause of parent $8.", 71));
	ge958ov25121 = (GE_ms("vdus4a", 6));
	ge958ov24958 = (GE_ms("VDUS-4", 6));
	ge958ov24743 = (GE_ms("feature name `$7\' appears twice in the Undefine subclause of parent $8.", 71));
	ge958ov25193 = (GE_ms("vlel3a", 6));
	ge958ov24992 = (GE_ms("VLEL-3", 6));
	ge958ov24815 = (GE_ms("feature name `$7\' appears twice in the Export subclause of parent $8.", 69));
	ge958ov25191 = (GE_ms("vlel1a", 6));
	ge958ov24990 = (GE_ms("VLEL-1", 6));
	ge958ov24813 = (GE_ms("\'all\' keyword appears twice in the Export subclause of parent $7.", 65));
	ge958ov25176 = (GE_ms("vhrc2a", 6));
	ge958ov24982 = (GE_ms("VHRC-2", 6));
	ge958ov24798 = (GE_ms("feature name `$7\' appears as first element of two Rename_pairs.", 63));
	ge958ov25194 = (GE_ms("vmfn0a", 6));
	ge958ov24816 = (GE_ms("two features with the same name `$7\'.", 37));
	ge958ov25295 = (GE_ms("gvtcg5a", 7));
	ge958ov25053 = (GE_ms("GVTCG-5", 7));
	ge958ov24917 = (GE_ms("actual generic parameter \'$7\' in type \'$8\' is not a reference type but the corresponding formal parameter is marked as reference.", 129));
	ge958ov25296 = (GE_ms("gvtcg5b", 7));
	ge958ov24918 = (GE_ms("actual generic parameter \'$7\' in type \'$8\' is not expanded type but the corresponding formal parameter is marked as expanded.", 125));
	ge958ov25267 = (GE_ms("vtug2a", 6));
	ge958ov25030 = (GE_ms("VTUG-2", 6));
	ge958ov24889 = (GE_ms("type \'$7\' has wrong number of actual generic parameters.", 56));
	ge958ov25266 = (GE_ms("vtug1a", 6));
	ge958ov25029 = (GE_ms("VTUG-1", 6));
	ge958ov24888 = (GE_ms("type \'$7\' has actual generic parameters but class $8 is not generic.", 68));
	ge958ov25260 = (GE_ms("vtcg4a", 6));
	ge958ov25026 = (GE_ms("VTCG-4", 6));
	ge958ov24882 = (GE_ms("base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8\' available as creation procedure to class $10.", 131));
	ge958ov25261 = (GE_ms("vtcg4b", 6));
	ge958ov24883 = (GE_ms("the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8\' as creation procedure in its generic constraint.", 175));
	ge958ov25259 = (GE_ms("vtcg3a", 6));
	ge958ov25025 = (GE_ms("VTCG-3", 6));
	ge958ov24881 = (GE_ms("actual generic parameter \'$7\' in type \'$9\' does not conform to constraint \'$8\'.", 79));
	ge959ov7362 = (GE_ms("tc", 2));
	ge959ov7363 = (GE_ms("&tc", 3));
	ge959ov7374 = (GE_ms(".cpp", 4));
	ge959ov7296 = (GE_ms("EIF_TEST", 8));
	ge959ov7311 = (GE_ms("GE_argv", 7));
	ge959ov7366 = (GE_ms("#undef", 6));
	ge958ov25285 = (GE_ms("gvhpr5a", 7));
	ge958ov25043 = (GE_ms("GVHPR-5", 7));
	ge958ov24907 = (GE_ms("cannot inherit from Tuple_type \'$7\'.", 36));
	ge958ov25224 = (GE_ms("vqmc6a", 6));
	ge958ov25012 = (GE_ms("VQMC-6", 6));
	ge958ov24846 = (GE_ms("bit constant attribute `$7\' is not declared of Bit_type.", 56));
	ge958ov25223 = (GE_ms("vqmc5a", 6));
	ge958ov25011 = (GE_ms("VQMC-5", 6));
	ge958ov24845 = (GE_ms("string constant attribute `$7\' is not declared of type STRING.", 62));
	ge958ov25222 = (GE_ms("vqmc4a", 6));
	ge958ov25010 = (GE_ms("VQMC-4", 6));
	ge958ov24844 = (GE_ms("real constant attribute `$7\' is not declared of type REAL or DOUBLE.", 68));
	ge958ov25221 = (GE_ms("vqmc3a", 6));
	ge958ov25009 = (GE_ms("VQMC-3", 6));
	ge958ov24843 = (GE_ms("integer constant attribute `$7\' is not declared of type INTEGER.", 64));
	ge958ov25220 = (GE_ms("vqmc2a", 6));
	ge958ov25008 = (GE_ms("VQMC-2", 6));
	ge958ov24842 = (GE_ms("character constant attribute `$7\' is not declared of type CHARACTER.", 68));
	ge958ov25219 = (GE_ms("vqmc1a", 6));
	ge958ov25007 = (GE_ms("VQMC-1", 6));
	ge958ov24841 = (GE_ms("boolean constant attribute `$7\' is not declared of type BOOLEAN.", 64));
	ge958ov25225 = (GE_ms("vqui0a", 6));
	ge958ov25013 = (GE_ms("VQUI", 4));
	ge958ov24847 = (GE_ms("unique attribute `$7\' is not declared of type INTEGER.", 54));
	ge958ov25234 = (GE_ms("vrle1a", 6));
	ge958ov25017 = (GE_ms("VRLE-1", 6));
	ge958ov24856 = (GE_ms("local variable name \'$7\' in feature `$8\' is also the final name of a feature.", 77));
	ge958ov25235 = (GE_ms("vrle2a", 6));
	ge958ov25018 = (GE_ms("VRLE-2", 6));
	ge958ov24857 = (GE_ms("local variable name \'$7\' in feature `$8\' is also the name of a formal argument of this feature.", 95));
	ge958ov25231 = (GE_ms("vreg0b", 6));
	ge958ov24853 = (GE_ms("local variable name \'$7\' appear twice in feature `$8\'.", 54));
	ge959ov7367 = (GE_ms("unsigned", 8));
	ge959ov7338 = (GE_ms("GE_rescue", 9));
	ge959ov7340 = (GE_ms("GE_setjmp", 9));
	ge959ov7337 = (GE_ms("GE_raise", 8));
	ge959ov7339 = (GE_ms("GE_retry", 8));
	ge959ov7323 = (GE_ms("GE_int8", 7));
	ge959ov7324 = (GE_ms("GE_int16", 8));
	ge959ov7325 = (GE_ms("GE_int32", 8));
	ge959ov7326 = (GE_ms("GE_int64", 8));
	ge959ov7330 = (GE_ms("GE_nat8", 7));
	ge959ov7331 = (GE_ms("GE_nat16", 8));
	ge959ov7332 = (GE_ms("GE_nat32", 8));
	ge959ov7333 = (GE_ms("GE_nat64", 8));
	ge958ov25158 = (GE_ms("vgcc6c", 6));
	ge958ov24780 = (GE_ms("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge958ov25161 = (GE_ms("vgcc8a", 6));
	ge958ov24975 = (GE_ms("VGCC-8", 6));
	ge958ov24783 = (GE_ms("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge958ov25154 = (GE_ms("vgcc5a", 6));
	ge958ov24973 = (GE_ms("VGCC-5", 6));
	ge958ov24776 = (GE_ms("creation expression with no Creation_call part, but $7 has a Creators part.", 75));
	ge958ov25157 = (GE_ms("vgcc6b", 6));
	ge958ov24779 = (GE_ms("`$7\' is not the final name of a procedure in class $9.", 54));
	ge958ov25074 = (GE_ms("vcfg3b", 6));
	ge958ov24696 = (GE_ms("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge958ov25173 = (GE_ms("vhpr3b", 6));
	ge958ov24980 = (GE_ms("VHPR-3", 6));
	ge958ov24795 = (GE_ms("invalid type \'$7\' in parent clause.", 35));
	ge958ov25284 = (GE_ms("gvhpr4a", 7));
	ge958ov25042 = (GE_ms("GVHPR-4", 7));
	ge958ov24906 = (GE_ms("cannot inherit from Bit_type \'$7\'.", 34));
	ge958ov25073 = (GE_ms("vcfg3a", 6));
	ge958ov24695 = (GE_ms("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge958ov25172 = (GE_ms("vhpr3a", 6));
	ge958ov24794 = (GE_ms("invalid type \'$7\' in parent clause.", 35));
	ge958ov25256 = (GE_ms("vtbt0b", 6));
	ge958ov24878 = (GE_ms("invalid type \'$7\': `$8\' is not the final name of a feature.", 59));
	ge958ov25255 = (GE_ms("vtbt0a", 6));
	ge958ov24877 = (GE_ms("invalid type \'$7\': `$8\' is not the final name of a constant attribute of type INTEGER.", 86));
	ge958ov25075 = (GE_ms("vcfg3c", 6));
	ge958ov24697 = (GE_ms("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge958ov25174 = (GE_ms("vhpr3c", 6));
	ge958ov24796 = (GE_ms("invalid type \'$7\' in parent clause.", 35));
	ge958ov25252 = (GE_ms("vtat1a", 6));
	ge958ov25022 = (GE_ms("VTAT-1", 6));
	ge958ov24874 = (GE_ms("invalid type \'$7\': the anchor `$8\' must be the final name of a query.", 69));
	ge958ov25253 = (GE_ms("vtat1b", 6));
	ge958ov24875 = (GE_ms("invalid type \'$7\': the anchor `$8\' must be the final name of a query, or an argument of routine `$9\'.", 101));
	ge958ov25092 = (GE_ms("vdpr3d", 6));
	ge958ov24942 = (GE_ms("VDPR-3", 6));
	ge958ov24714 = (GE_ms("feature `$7\' is not the redeclaration of a feature.", 51));
	ge958ov25087 = (GE_ms("vdpr1b", 6));
	ge958ov24940 = (GE_ms("VDPR-1", 6));
	ge958ov24709 = (GE_ms("Precursor expression does not appear in a Routine_body.", 55));
	ge958ov25090 = (GE_ms("vdpr3b", 6));
	ge958ov24712 = (GE_ms("feature `$7\' is not the redefinition of an effective feature.", 61));
	ge958ov25089 = (GE_ms("vdpr3a", 6));
	ge958ov24711 = (GE_ms("conflict in Precursor construct between effective features `$7\' inherited from \'$8\' and `$9\' inherited from \'$10\'.", 114));
	ge958ov25088 = (GE_ms("vdpr2a", 6));
	ge958ov24941 = (GE_ms("VDPR-2", 6));
	ge958ov24710 = (GE_ms("class $7 in Precursor construct is not a parent of class $6.", 60));
	ge958ov25273 = (GE_ms("vuar4a", 6));
	ge958ov25033 = (GE_ms("VUAR-4", 6));
	ge958ov24895 = (GE_ms("`$7\' is not the final name of a feature in class $5.", 52));
	ge958ov25278 = (GE_ms("vweq0a", 6));
	ge958ov25037 = (GE_ms("VWEQ", 4));
	ge958ov24900 = (GE_ms("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms to the other.", 76));
	ge777ov14321 = (GE_ms("***unknown_name***", 18));
	ge958ov25060 = (GE_ms("vaol1a", 6));
	ge958ov24928 = (GE_ms("VAOL-1", 6));
	ge958ov24682 = (GE_ms("old expression does not appear in a postcondition.", 50));
	ge958ov25207 = (GE_ms("vpca1b", 6));
	ge958ov25001 = (GE_ms("VPCA-1", 6));
	ge958ov24829 = (GE_ms("`$7\' is not the final name of a feature in class $8.", 52));
	ge958ov25214 = (GE_ms("vpca5b", 6));
	ge958ov25005 = (GE_ms("VPCA-5", 6));
	ge958ov24836 = (GE_ms("the type \'$10\' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 155));
	ge958ov25213 = (GE_ms("vpca5a", 6));
	ge958ov24835 = (GE_ms("the type \'$11\' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 168));
	ge958ov25212 = (GE_ms("vpca4b", 6));
	ge958ov25004 = (GE_ms("VPCA-4", 6));
	ge958ov24834 = (GE_ms("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge958ov25211 = (GE_ms("vpca4a", 6));
	ge958ov24833 = (GE_ms("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge958ov25210 = (GE_ms("vpca3b", 6));
	ge958ov25003 = (GE_ms("VPCA-3", 6));
	ge958ov24832 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge958ov25209 = (GE_ms("vpca3a", 6));
	ge958ov24831 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge958ov25208 = (GE_ms("vpca2a", 6));
	ge958ov25002 = (GE_ms("VPCA-2", 6));
	ge958ov24830 = (GE_ms("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge958ov25206 = (GE_ms("vpca1a", 6));
	ge958ov24828 = (GE_ms("`$7\' is not the final name of a feature in class $5.", 52));
	ge958ov25281 = (GE_ms("vwst2a", 6));
	ge958ov25039 = (GE_ms("VWST-2", 6));
	ge958ov24903 = (GE_ms("feature name `$7\' appears twice in strip expression.", 52));
	ge958ov25279 = (GE_ms("vwst1a", 6));
	ge958ov25038 = (GE_ms("VWST-1", 6));
	ge958ov24901 = (GE_ms("feature name `$7\' is not the final name of a feature in class $5.", 65));
	ge958ov25218 = (GE_ms("vpir1d", 6));
	ge958ov25006 = (GE_ms("VPIR-1", 6));
	ge958ov24840 = (GE_ms("local variable name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 118));
	ge958ov25217 = (GE_ms("vpir1c", 6));
	ge958ov24839 = (GE_ms("local variable name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 119));
	ge958ov25237 = (GE_ms("vrlv1b", 6));
	ge958ov25019 = (GE_ms("VRLV-1", 6));
	ge958ov24859 = (GE_ms("local variable name \'$7\' in inline agent is also the final name of a feature.", 77));
	ge958ov25239 = (GE_ms("vrlv2b", 6));
	ge958ov25020 = (GE_ms("VRLV-2", 6));
	ge958ov24861 = (GE_ms("local variable name \'$7\' in inline agent is also the name of a formal argument of this agent.", 93));
	ge958ov25229 = (GE_ms("vred0d", 6));
	ge958ov25014 = (GE_ms("VRED", 4));
	ge958ov24851 = (GE_ms("local variable name \'$7\' appear twice in inline agent.", 54));
	ge958ov25216 = (GE_ms("vpir1b", 6));
	ge958ov24838 = (GE_ms("argument name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 112));
	ge958ov25215 = (GE_ms("vpir1a", 6));
	ge958ov24837 = (GE_ms("argument name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 113));
	ge958ov25233 = (GE_ms("vrfa0b", 6));
	ge958ov24855 = (GE_ms("argument name \'$7\' in inline agent is also the final name of a feature.", 71));
	ge958ov25228 = (GE_ms("vred0c", 6));
	ge958ov24850 = (GE_ms("argument name \'$7\' appear twice in inline agent.", 48));
	ge958ov25263 = (GE_ms("vtct0b", 6));
	ge958ov24885 = (GE_ms("type based on unknown class $7.", 31));
	ge958ov25079 = (GE_ms("vcfg3h", 6));
	ge958ov24701 = (GE_ms("constraint of formal generic parameter \'$7\' contains \'$8\' itself.", 65));
	ge958ov25077 = (GE_ms("vcfg3e", 6));
	ge958ov24699 = (GE_ms("constraint of formal generic parameter \'$7\' is another formal generic parameter \'$8\'.", 85));
	ge958ov25076 = (GE_ms("vcfg3d", 6));
	ge958ov24698 = (GE_ms("constraint of formal generic parameter \'$7\' is \'$8\' itself.", 59));
	ge958ov25067 = (GE_ms("vbac2a", 6));
	ge958ov24932 = (GE_ms("VBAC-2", 6));
	ge958ov24689 = (GE_ms("query `$7\' in class $8 has no assigner command.", 47));
	ge958ov25066 = (GE_ms("vbac1a", 6));
	ge958ov24931 = (GE_ms("VBAC-1", 6));
	ge958ov24688 = (GE_ms("the source of the assigner call (of type \'$7\') does not conform nor convert to its target (of type \'$8\').", 105));
	ge958ov25182 = (GE_ms("vjar0a", 6));
	ge958ov24985 = (GE_ms("VJAR", 4));
	ge958ov24804 = (GE_ms("the source of the assignment (of type \'$7\') does not conform nor convert to its target entity (of type \'$8\').", 109));
	ge958ov25122 = (GE_ms("veen0a", 6));
	ge958ov24959 = (GE_ms("VEEN", 4));
	ge958ov24744 = (GE_ms("`$7\' appears in feature `$8\', but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of feature `$8\'.", 152));
	ge958ov25123 = (GE_ms("veen0b", 6));
	ge958ov24745 = (GE_ms("`$7\' appears in an inline agent, but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of this inline agent.", 160));
	ge958ov25184 = (GE_ms("vjaw0b", 6));
	ge958ov24986 = (GE_ms("VJAW", 4));
	ge958ov24806 = (GE_ms("`$7\' is the name of a formal argument of feature `$8\'. A Writable is either a local variable (including Result) or an attribute.", 128));
	ge958ov25185 = (GE_ms("vjaw0c", 6));
	ge958ov24807 = (GE_ms("`$7\' is the name of a formal argument of an inline agent. A Writable is either a local variable (including Result) or an attribute.", 131));
	ge958ov25183 = (GE_ms("vjaw0a", 6));
	ge958ov24805 = (GE_ms("feature `$7\' is not an attribute. A Writable is either a local variable (including Result) or an attribute.", 107));
	ge958ov25186 = (GE_ms("vjrv0a", 6));
	ge958ov24987 = (GE_ms("VJRV", 4));
	ge958ov24808 = (GE_ms("the type \'$7\' of the target entity of the assignment attempt is not a reference type.", 85));
	ge958ov25205 = (GE_ms("vomb2a", 6));
	ge958ov25000 = (GE_ms("VOMB-2", 6));
	ge958ov24827 = (GE_ms("inspect constant of type \'$7\' different from type \'$8\' of inspect expression.", 77));
	ge958ov25204 = (GE_ms("vomb1a", 6));
	ge958ov24999 = (GE_ms("VOMB-1", 6));
	ge958ov24826 = (GE_ms("inspect expression of type \'$7\' different from INTEGER or CHARACTER.", 68));
	ge958ov25065 = (GE_ms("vave0a", 6));
	ge958ov24930 = (GE_ms("VAVE", 4));
	ge958ov24687 = (GE_ms("loop variant expression of non-INTEGER type \'$7\'.", 49));
	ge959ov7369 = (GE_ms("while", 5));
	ge958ov25160 = (GE_ms("vgcc6e", 6));
	ge958ov24782 = (GE_ms("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge958ov25162 = (GE_ms("vgcc8b", 6));
	ge958ov24784 = (GE_ms("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge958ov25155 = (GE_ms("vgcc5b", 6));
	ge958ov24777 = (GE_ms("creation instruction with no Creation_call part, but $7 has a Creators part.", 76));
	ge958ov25153 = (GE_ms("vgcc3a", 6));
	ge958ov24972 = (GE_ms("VGCC-3", 6));
	ge958ov24775 = (GE_ms("explicit creation type \'$7\' does not conform to target entity type \'$8\'.", 72));
	ge958ov25159 = (GE_ms("vgcc6d", 6));
	ge958ov24781 = (GE_ms("`$7\' is not the final name of a procedure in class $9.", 54));
	ge958ov25086 = (GE_ms("vdpr1a", 6));
	ge958ov24708 = (GE_ms("Precursor instruction does not appear in a Routine_body.", 56));
	ge958ov25187 = (GE_ms("vkcn1a", 6));
	ge958ov24809 = (GE_ms("query `$8\' of class $9 appears in a call instruction.", 53));
	ge958ov25282 = (GE_ms("vxrt0a", 6));
	ge958ov25040 = (GE_ms("VXRT", 4));
	ge958ov24904 = (GE_ms("Retry instruction does not appear in a Rescue clause.", 53));
	ge959ov7344 = (GE_ms("goto", 4));
	ge863ov16446 = (GE_ms("TUPLE", 5));
	ge856ov23616 = (GE_ms("like Current", 12));
	ge859ov22640 = (GE_ms("like ", 5));
	ge835ov22672 = (GE_ms("BIT ", 4));
	ge1245ov10503 = (GE_ms("root", 4));
	ge1226ov20157 = (GE_ms("Namespace declared twice", 24));
	ge1226ov20156 = (GE_ms("Undeclared namespace error", 26));
	ge418ov9365 = (GE_ms("\n", 1));
	ge311ov9365 = (GE_ms("\n", 1));
	ge302ov9365 = (GE_ms("\n", 1));
	ge59ov4245 = (GE_ms("\n", 1));
	ge59ov4246 = (GE_ms("\n", 1));
	ge59ov4247 = (GE_ms("\nOptions:\n", 10));
	ge781ov23338 = (GE_ms("alias \"", 7));
	ge777ov14386 = (GE_ms("alias \"[]\"", 10));
	ge777ov14367 = (GE_ms("alias \"and\"", 11));
	ge777ov14383 = (GE_ms("alias \"and then\"", 16));
	ge777ov14371 = (GE_ms("alias \"//\"", 10));
	ge777ov14372 = (GE_ms("alias \"/\"", 9));
	ge777ov14373 = (GE_ms("alias \">=\"", 10));
	ge777ov14374 = (GE_ms("alias \">\"", 9));
	ge777ov14368 = (GE_ms("alias \"implies\"", 15));
	ge777ov14375 = (GE_ms("alias \"<=\"", 10));
	ge777ov14376 = (GE_ms("alias \"<\"", 9));
	ge777ov14377 = (GE_ms("alias \"-\"", 9));
	ge777ov14378 = (GE_ms("alias \"\\\\\"", 10));
	ge777ov14369 = (GE_ms("alias \"or\"", 10));
	ge777ov14384 = (GE_ms("alias \"or else\"", 15));
	ge777ov14379 = (GE_ms("alias \"+\"", 9));
	ge777ov14380 = (GE_ms("alias \"^\"", 9));
	ge777ov14381 = (GE_ms("alias \"*\"", 9));
	ge777ov14370 = (GE_ms("alias \"xor\"", 11));
	ge777ov14382 = (GE_ms("alias \"..\"", 10));
	ge777ov14385 = (GE_ms("alias \"not\"", 11));
	ge1293ov25477 = (GE_ms("us-ascii", 8));
	ge1293ov25479 = (GE_ms("utf-8", 5));
	ge777ov14363 = (GE_ms("infix \"or else\"", 15));
	ge777ov14362 = (GE_ms("infix \"and then\"", 16));
	ge777ov14350 = (GE_ms("infix \"//\"", 10));
	ge777ov14351 = (GE_ms("infix \"/\"", 9));
	ge777ov14352 = (GE_ms("infix \">=\"", 10));
	ge777ov14353 = (GE_ms("infix \">\"", 9));
	ge777ov14354 = (GE_ms("infix \"<=\"", 10));
	ge777ov14355 = (GE_ms("infix \"<\"", 9));
	ge777ov14356 = (GE_ms("infix \"-\"", 9));
	ge777ov14357 = (GE_ms("infix \"\\\\\"", 10));
	ge777ov14358 = (GE_ms("infix \"+\"", 9));
	ge777ov14359 = (GE_ms("infix \"^\"", 9));
	ge777ov14360 = (GE_ms("infix \"*\"", 9));
	ge777ov14361 = (GE_ms("infix \"..\"", 10));
	ge777ov14365 = (GE_ms("prefix \"-\"", 10));
	ge777ov14366 = (GE_ms("prefix \"+\"", 10));
	ge777ov14346 = (GE_ms("infix \"and\"", 11));
	ge777ov14347 = (GE_ms("infix \"implies\"", 15));
	ge777ov14348 = (GE_ms("infix \"or\"", 10));
	ge777ov14349 = (GE_ms("infix \"xor\"", 11));
	ge777ov14364 = (GE_ms("prefix \"not\"", 12));
	ge803ov21567 = (GE_ms("infix \"", 7));
	ge803ov21566 = (GE_ms("prefix \"", 8));
	ge808ov23431 = (GE_ms("infix \"", 7));
	ge818ov23323 = (GE_ms("prefix \"", 8));
	ge1026ov4012 = (GE_ms("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge1023ov4012 = (GE_ms("found invalid expression \'$1\' at $2", 35));
	ge230ov4012 = (GE_ms("$0: too many (i.e. $1) nested include files", 43));
	ge229ov4012 = (GE_ms("Syntax error in \"$1\" at line $2", 31));
	ge1017ov4012 = (GE_ms("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1033ov4012 = (GE_ms("option name \'$1\' in option-element is unknown $2", 48));
	ge1030ov4012 = (GE_ms("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1029ov4012 = (GE_ms("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1025ov4012 = (GE_ms("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1032ov4012 = (GE_ms("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1024ov4012 = (GE_ms("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1036ov4012 = (GE_ms("Xace document must have a \'$1\' root-element $2", 46));
	ge1020ov4012 = (GE_ms("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1031ov4012 = (GE_ms("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1035ov4012 = (GE_ms("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1027ov4012 = (GE_ms("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1018ov4012 = (GE_ms("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge224ov4012 = (GE_ms("$0: cannot write to \'$1\'", 24));
	ge227ov4012 = (GE_ms("$1", 2));
	ge234ov4012 = (GE_ms("$0 version $1", 13));
	ge223ov4012 = (GE_ms("$0: cannot read \'$1\'", 20));
	ge412ov25556 = (GE_ms("", 0));
	ge399ov1824 = (GE_ms("", 0));
	geic3 = (GE_ms(" (label on item #", 17));
	geic4 = (GE_ms(" with a manifest tuple argument", 31));
	geic5 = (GE_ms(" of type ", 9));
}

EIF_TYPE GE_types[1503] = {
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
{0, 85, EIF_TRUE},
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
{0, 109, EIF_FALSE},
{0, 110, EIF_FALSE},
{0, 111, EIF_FALSE},
{0, 112, EIF_FALSE},
{0, 113, EIF_FALSE},
{0, 114, EIF_FALSE},
{0, 115, EIF_FALSE},
{0, 116, EIF_FALSE},
{0, 117, EIF_TRUE},
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
{0, 131, EIF_TRUE},
{0, 132, EIF_FALSE},
{0, 133, EIF_TRUE},
{0, 134, EIF_FALSE},
{0, 135, EIF_FALSE},
{0, 136, EIF_FALSE},
{0, 137, EIF_FALSE},
{0, 138, EIF_FALSE},
{0, 139, EIF_FALSE},
{0, 140, EIF_TRUE},
{0, 141, EIF_TRUE},
{0, 142, EIF_FALSE},
{0, 143, EIF_TRUE},
{0, 144, EIF_TRUE},
{0, 145, EIF_FALSE},
{0, 146, EIF_FALSE},
{0, 147, EIF_FALSE},
{0, 148, EIF_TRUE},
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
{0, 161, EIF_FALSE},
{0, 162, EIF_FALSE},
{0, 163, EIF_FALSE},
{0, 164, EIF_FALSE},
{0, 165, EIF_FALSE},
{0, 166, EIF_FALSE},
{0, 167, EIF_FALSE},
{0, 168, EIF_FALSE},
{0, 169, EIF_FALSE},
{0, 170, EIF_FALSE},
{0, 171, EIF_FALSE},
{0, 172, EIF_FALSE},
{0, 173, EIF_FALSE},
{0, 174, EIF_FALSE},
{0, 175, EIF_FALSE},
{0, 176, EIF_FALSE},
{0, 177, EIF_FALSE},
{0, 178, EIF_FALSE},
{0, 179, EIF_FALSE},
{0, 180, EIF_FALSE},
{0, 181, EIF_FALSE},
{0, 182, EIF_FALSE},
{0, 183, EIF_FALSE},
{0, 184, EIF_FALSE},
{0, 185, EIF_FALSE},
{0, 186, EIF_FALSE},
{0, 187, EIF_FALSE},
{0, 188, EIF_FALSE},
{0, 189, EIF_FALSE},
{0, 190, EIF_FALSE},
{0, 191, EIF_FALSE},
{0, 192, EIF_FALSE},
{0, 193, EIF_FALSE},
{0, 194, EIF_FALSE},
{0, 195, EIF_FALSE},
{0, 196, EIF_FALSE},
{0, 197, EIF_FALSE},
{0, 198, EIF_FALSE},
{0, 199, EIF_FALSE},
{0, 200, EIF_FALSE},
{0, 201, EIF_FALSE},
{0, 202, EIF_FALSE},
{0, 203, EIF_FALSE},
{0, 204, EIF_FALSE},
{0, 205, EIF_FALSE},
{0, 206, EIF_FALSE},
{0, 207, EIF_FALSE},
{0, 208, EIF_FALSE},
{0, 209, EIF_FALSE},
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
{0, 244, EIF_FALSE},
{0, 245, EIF_FALSE},
{0, 246, EIF_FALSE},
{0, 247, EIF_FALSE},
{0, 248, EIF_FALSE},
{0, 249, EIF_FALSE},
{0, 250, EIF_FALSE},
{0, 251, EIF_FALSE},
{0, 252, EIF_FALSE},
{0, 253, EIF_FALSE},
{0, 254, EIF_FALSE},
{0, 255, EIF_FALSE},
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
{0, 280, EIF_FALSE},
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
{0, 335, EIF_FALSE},
{0, 336, EIF_TRUE},
{0, 337, EIF_FALSE},
{0, 338, EIF_FALSE},
{0, 339, EIF_TRUE},
{0, 340, EIF_FALSE},
{0, 341, EIF_FALSE},
{0, 342, EIF_FALSE},
{0, 343, EIF_FALSE},
{0, 344, EIF_FALSE},
{0, 345, EIF_FALSE},
{0, 346, EIF_FALSE},
{0, 347, EIF_TRUE},
{0, 348, EIF_FALSE},
{0, 349, EIF_FALSE},
{0, 350, EIF_FALSE},
{0, 351, EIF_FALSE},
{0, 352, EIF_FALSE},
{0, 353, EIF_FALSE},
{0, 354, EIF_FALSE},
{0, 355, EIF_FALSE},
{0, 356, EIF_TRUE},
{0, 357, EIF_FALSE},
{0, 358, EIF_FALSE},
{0, 359, EIF_FALSE},
{0, 360, EIF_FALSE},
{0, 361, EIF_FALSE},
{0, 362, EIF_FALSE},
{0, 363, EIF_FALSE},
{0, 364, EIF_FALSE},
{0, 365, EIF_FALSE},
{0, 366, EIF_FALSE},
{0, 367, EIF_FALSE},
{0, 368, EIF_FALSE},
{0, 369, EIF_FALSE},
{0, 370, EIF_FALSE},
{0, 371, EIF_FALSE},
{0, 372, EIF_FALSE},
{0, 373, EIF_FALSE},
{0, 374, EIF_TRUE},
{0, 375, EIF_FALSE},
{0, 376, EIF_TRUE},
{0, 377, EIF_FALSE},
{0, 378, EIF_TRUE},
{0, 379, EIF_TRUE},
{0, 380, EIF_FALSE},
{0, 381, EIF_TRUE},
{0, 382, EIF_FALSE},
{0, 383, EIF_TRUE},
{0, 384, EIF_FALSE},
{0, 385, EIF_FALSE},
{0, 386, EIF_TRUE},
{0, 387, EIF_FALSE},
{0, 388, EIF_TRUE},
{0, 389, EIF_FALSE},
{0, 390, EIF_FALSE},
{0, 391, EIF_TRUE},
{0, 392, EIF_FALSE},
{0, 393, EIF_FALSE},
{0, 394, EIF_FALSE},
{0, 395, EIF_FALSE},
{0, 396, EIF_FALSE},
{0, 397, EIF_FALSE},
{0, 398, EIF_FALSE},
{0, 399, EIF_FALSE},
{0, 400, EIF_FALSE},
{0, 401, EIF_FALSE},
{0, 402, EIF_FALSE},
{0, 403, EIF_FALSE},
{0, 404, EIF_FALSE},
{0, 405, EIF_FALSE},
{0, 406, EIF_FALSE},
{0, 407, EIF_FALSE},
{0, 408, EIF_FALSE},
{0, 409, EIF_FALSE},
{0, 410, EIF_FALSE},
{0, 411, EIF_FALSE},
{0, 412, EIF_FALSE},
{0, 413, EIF_FALSE},
{0, 414, EIF_FALSE},
{0, 415, EIF_FALSE},
{0, 416, EIF_FALSE},
{0, 417, EIF_FALSE},
{0, 418, EIF_FALSE},
{0, 419, EIF_FALSE},
{0, 420, EIF_FALSE},
{0, 421, EIF_FALSE},
{0, 422, EIF_FALSE},
{0, 423, EIF_TRUE},
{0, 424, EIF_TRUE},
{0, 425, EIF_FALSE},
{0, 426, EIF_FALSE},
{0, 427, EIF_TRUE},
{0, 428, EIF_FALSE},
{0, 429, EIF_FALSE},
{0, 430, EIF_FALSE},
{0, 431, EIF_FALSE},
{0, 432, EIF_FALSE},
{0, 433, EIF_FALSE},
{0, 434, EIF_FALSE},
{0, 435, EIF_FALSE},
{0, 436, EIF_FALSE},
{0, 437, EIF_FALSE},
{0, 438, EIF_FALSE},
{0, 439, EIF_FALSE},
{0, 440, EIF_FALSE},
{0, 441, EIF_FALSE},
{0, 442, EIF_FALSE},
{0, 443, EIF_FALSE},
{0, 444, EIF_FALSE},
{0, 445, EIF_FALSE},
{0, 446, EIF_FALSE},
{0, 447, EIF_FALSE},
{0, 448, EIF_FALSE},
{0, 449, EIF_FALSE},
{0, 450, EIF_FALSE},
{0, 451, EIF_FALSE},
{0, 452, EIF_TRUE},
{0, 453, EIF_FALSE},
{0, 454, EIF_FALSE},
{0, 455, EIF_TRUE},
{0, 456, EIF_FALSE},
{0, 457, EIF_FALSE},
{0, 458, EIF_TRUE},
{0, 459, EIF_FALSE},
{0, 460, EIF_FALSE},
{0, 461, EIF_TRUE},
{0, 462, EIF_FALSE},
{0, 463, EIF_TRUE},
{0, 464, EIF_FALSE},
{0, 465, EIF_FALSE},
{0, 466, EIF_TRUE},
{0, 467, EIF_FALSE},
{0, 468, EIF_FALSE},
{0, 469, EIF_TRUE},
{0, 470, EIF_FALSE},
{0, 471, EIF_FALSE},
{0, 472, EIF_TRUE},
{0, 473, EIF_FALSE},
{0, 474, EIF_FALSE},
{0, 475, EIF_TRUE},
{0, 476, EIF_FALSE},
{0, 477, EIF_TRUE},
{0, 478, EIF_FALSE},
{0, 479, EIF_FALSE},
{0, 480, EIF_TRUE},
{0, 481, EIF_FALSE},
{0, 482, EIF_FALSE},
{0, 483, EIF_TRUE},
{0, 484, EIF_FALSE},
{0, 485, EIF_FALSE},
{0, 486, EIF_TRUE},
{0, 487, EIF_FALSE},
{0, 488, EIF_TRUE},
{0, 489, EIF_FALSE},
{0, 490, EIF_FALSE},
{0, 491, EIF_TRUE},
{0, 492, EIF_FALSE},
{0, 493, EIF_TRUE},
{0, 494, EIF_FALSE},
{0, 495, EIF_FALSE},
{0, 496, EIF_TRUE},
{0, 497, EIF_FALSE},
{0, 498, EIF_FALSE},
{0, 499, EIF_TRUE},
{0, 500, EIF_FALSE},
{0, 501, EIF_FALSE},
{0, 502, EIF_TRUE},
{0, 503, EIF_FALSE},
{0, 504, EIF_FALSE},
{0, 505, EIF_TRUE},
{0, 506, EIF_FALSE},
{0, 507, EIF_FALSE},
{0, 508, EIF_TRUE},
{0, 509, EIF_FALSE},
{0, 510, EIF_FALSE},
{0, 511, EIF_TRUE},
{0, 512, EIF_FALSE},
{0, 513, EIF_FALSE},
{0, 514, EIF_FALSE},
{0, 515, EIF_FALSE},
{0, 516, EIF_FALSE},
{0, 517, EIF_FALSE},
{0, 518, EIF_FALSE},
{0, 519, EIF_FALSE},
{0, 520, EIF_FALSE},
{0, 521, EIF_FALSE},
{0, 522, EIF_FALSE},
{0, 523, EIF_FALSE},
{0, 524, EIF_FALSE},
{0, 525, EIF_FALSE},
{0, 526, EIF_FALSE},
{0, 527, EIF_FALSE},
{0, 528, EIF_TRUE},
{0, 529, EIF_FALSE},
{0, 530, EIF_TRUE},
{0, 531, EIF_TRUE},
{0, 532, EIF_FALSE},
{0, 533, EIF_TRUE},
{0, 534, EIF_FALSE},
{0, 535, EIF_TRUE},
{0, 536, EIF_FALSE},
{0, 537, EIF_TRUE},
{0, 538, EIF_FALSE},
{0, 539, EIF_TRUE},
{0, 540, EIF_FALSE},
{0, 541, EIF_FALSE},
{0, 542, EIF_TRUE},
{0, 543, EIF_FALSE},
{0, 544, EIF_TRUE},
{0, 545, EIF_FALSE},
{0, 546, EIF_FALSE},
{0, 547, EIF_FALSE},
{0, 548, EIF_FALSE},
{0, 549, EIF_FALSE},
{0, 550, EIF_TRUE},
{0, 551, EIF_FALSE},
{0, 552, EIF_FALSE},
{0, 553, EIF_TRUE},
{0, 554, EIF_FALSE},
{0, 555, EIF_FALSE},
{0, 556, EIF_TRUE},
{0, 557, EIF_FALSE},
{0, 558, EIF_TRUE},
{0, 559, EIF_FALSE},
{0, 560, EIF_TRUE},
{0, 561, EIF_FALSE},
{0, 562, EIF_FALSE},
{0, 563, EIF_TRUE},
{0, 564, EIF_FALSE},
{0, 565, EIF_TRUE},
{0, 566, EIF_FALSE},
{0, 567, EIF_FALSE},
{0, 568, EIF_FALSE},
{0, 569, EIF_TRUE},
{0, 570, EIF_FALSE},
{0, 571, EIF_FALSE},
{0, 572, EIF_TRUE},
{0, 573, EIF_FALSE},
{0, 574, EIF_FALSE},
{0, 575, EIF_TRUE},
{0, 576, EIF_FALSE},
{0, 577, EIF_TRUE},
{0, 578, EIF_FALSE},
{0, 579, EIF_FALSE},
{0, 580, EIF_FALSE},
{0, 581, EIF_TRUE},
{0, 582, EIF_FALSE},
{0, 583, EIF_FALSE},
{0, 584, EIF_FALSE},
{0, 585, EIF_FALSE},
{0, 586, EIF_TRUE},
{0, 587, EIF_FALSE},
{0, 588, EIF_FALSE},
{0, 589, EIF_FALSE},
{0, 590, EIF_FALSE},
{0, 591, EIF_FALSE},
{0, 592, EIF_FALSE},
{0, 593, EIF_TRUE},
{0, 594, EIF_TRUE},
{0, 595, EIF_FALSE},
{0, 596, EIF_TRUE},
{0, 597, EIF_TRUE},
{0, 598, EIF_TRUE},
{0, 599, EIF_TRUE},
{0, 600, EIF_FALSE},
{0, 601, EIF_FALSE},
{0, 602, EIF_FALSE},
{0, 603, EIF_TRUE},
{0, 604, EIF_TRUE},
{0, 605, EIF_TRUE},
{0, 606, EIF_FALSE},
{0, 607, EIF_FALSE},
{0, 608, EIF_FALSE},
{0, 609, EIF_FALSE},
{0, 610, EIF_TRUE},
{0, 611, EIF_TRUE},
{0, 612, EIF_FALSE},
{0, 613, EIF_FALSE},
{0, 614, EIF_FALSE},
{0, 615, EIF_TRUE},
{0, 616, EIF_FALSE},
{0, 617, EIF_FALSE},
{0, 618, EIF_FALSE},
{0, 619, EIF_FALSE},
{0, 620, EIF_TRUE},
{0, 621, EIF_FALSE},
{0, 622, EIF_FALSE},
{0, 623, EIF_FALSE},
{0, 624, EIF_FALSE},
{0, 625, EIF_FALSE},
{0, 626, EIF_TRUE},
{0, 627, EIF_FALSE},
{0, 628, EIF_FALSE},
{0, 629, EIF_FALSE},
{0, 630, EIF_TRUE},
{0, 631, EIF_FALSE},
{0, 632, EIF_TRUE},
{0, 633, EIF_FALSE},
{0, 634, EIF_FALSE},
{0, 635, EIF_TRUE},
{0, 636, EIF_FALSE},
{0, 637, EIF_FALSE},
{0, 638, EIF_FALSE},
{0, 639, EIF_FALSE},
{0, 640, EIF_TRUE},
{0, 641, EIF_FALSE},
{0, 642, EIF_TRUE},
{0, 643, EIF_FALSE},
{0, 644, EIF_FALSE},
{0, 645, EIF_TRUE},
{0, 646, EIF_FALSE},
{0, 647, EIF_TRUE},
{0, 648, EIF_TRUE},
{0, 649, EIF_FALSE},
{0, 650, EIF_FALSE},
{0, 651, EIF_TRUE},
{0, 652, EIF_FALSE},
{0, 653, EIF_TRUE},
{0, 654, EIF_FALSE},
{0, 655, EIF_FALSE},
{0, 656, EIF_TRUE},
{0, 657, EIF_FALSE},
{0, 658, EIF_TRUE},
{0, 659, EIF_FALSE},
{0, 660, EIF_TRUE},
{0, 661, EIF_FALSE},
{0, 662, EIF_TRUE},
{0, 663, EIF_FALSE},
{0, 664, EIF_TRUE},
{0, 665, EIF_FALSE},
{0, 666, EIF_FALSE},
{0, 667, EIF_FALSE},
{0, 668, EIF_FALSE},
{0, 669, EIF_TRUE},
{0, 670, EIF_FALSE},
{0, 671, EIF_FALSE},
{0, 672, EIF_FALSE},
{0, 673, EIF_FALSE},
{0, 674, EIF_FALSE},
{0, 675, EIF_FALSE},
{0, 676, EIF_FALSE},
{0, 677, EIF_FALSE},
{0, 678, EIF_FALSE},
{0, 679, EIF_FALSE},
{0, 680, EIF_FALSE},
{0, 681, EIF_FALSE},
{0, 682, EIF_TRUE},
{0, 683, EIF_FALSE},
{0, 684, EIF_FALSE},
{0, 685, EIF_FALSE},
{0, 686, EIF_FALSE},
{0, 687, EIF_FALSE},
{0, 688, EIF_TRUE},
{0, 689, EIF_TRUE},
{0, 690, EIF_FALSE},
{0, 691, EIF_FALSE},
{0, 692, EIF_FALSE},
{0, 693, EIF_FALSE},
{0, 694, EIF_FALSE},
{0, 695, EIF_TRUE},
{0, 696, EIF_FALSE},
{0, 697, EIF_TRUE},
{0, 698, EIF_FALSE},
{0, 699, EIF_FALSE},
{0, 700, EIF_FALSE},
{0, 701, EIF_TRUE},
{0, 702, EIF_FALSE},
{0, 703, EIF_FALSE},
{0, 704, EIF_FALSE},
{0, 705, EIF_FALSE},
{0, 706, EIF_TRUE},
{0, 707, EIF_FALSE},
{0, 708, EIF_FALSE},
{0, 709, EIF_TRUE},
{0, 710, EIF_FALSE},
{0, 711, EIF_FALSE},
{0, 712, EIF_FALSE},
{0, 713, EIF_FALSE},
{0, 714, EIF_TRUE},
{0, 715, EIF_FALSE},
{0, 716, EIF_FALSE},
{0, 717, EIF_FALSE},
{0, 718, EIF_FALSE},
{0, 719, EIF_FALSE},
{0, 720, EIF_FALSE},
{0, 721, EIF_FALSE},
{0, 722, EIF_FALSE},
{0, 723, EIF_TRUE},
{0, 724, EIF_TRUE},
{0, 725, EIF_FALSE},
{0, 726, EIF_FALSE},
{0, 727, EIF_FALSE},
{0, 728, EIF_FALSE},
{0, 729, EIF_TRUE},
{0, 730, EIF_TRUE},
{0, 731, EIF_FALSE},
{0, 732, EIF_FALSE},
{0, 733, EIF_FALSE},
{0, 734, EIF_TRUE},
{0, 735, EIF_FALSE},
{0, 736, EIF_TRUE},
{0, 737, EIF_FALSE},
{0, 738, EIF_FALSE},
{0, 739, EIF_FALSE},
{0, 740, EIF_TRUE},
{0, 741, EIF_FALSE},
{0, 742, EIF_FALSE},
{0, 743, EIF_FALSE},
{0, 744, EIF_FALSE},
{0, 745, EIF_TRUE},
{0, 746, EIF_FALSE},
{0, 747, EIF_FALSE},
{0, 748, EIF_FALSE},
{0, 749, EIF_FALSE},
{0, 750, EIF_FALSE},
{0, 751, EIF_TRUE},
{0, 752, EIF_FALSE},
{0, 753, EIF_TRUE},
{0, 754, EIF_FALSE},
{0, 755, EIF_FALSE},
{0, 756, EIF_FALSE},
{0, 757, EIF_TRUE},
{0, 758, EIF_FALSE},
{0, 759, EIF_FALSE},
{0, 760, EIF_FALSE},
{0, 761, EIF_TRUE},
{0, 762, EIF_FALSE},
{0, 763, EIF_TRUE},
{0, 764, EIF_FALSE},
{0, 765, EIF_FALSE},
{0, 766, EIF_FALSE},
{0, 767, EIF_TRUE},
{0, 768, EIF_FALSE},
{0, 769, EIF_TRUE},
{0, 770, EIF_FALSE},
{0, 771, EIF_FALSE},
{0, 772, EIF_TRUE},
{0, 773, EIF_FALSE},
{0, 774, EIF_FALSE},
{0, 775, EIF_FALSE},
{0, 776, EIF_FALSE},
{0, 777, EIF_TRUE},
{0, 778, EIF_FALSE},
{0, 779, EIF_TRUE},
{0, 780, EIF_FALSE},
{0, 781, EIF_FALSE},
{0, 782, EIF_FALSE},
{0, 783, EIF_TRUE},
{0, 784, EIF_FALSE},
{0, 785, EIF_FALSE},
{0, 786, EIF_FALSE},
{0, 787, EIF_FALSE},
{0, 788, EIF_FALSE},
{0, 789, EIF_FALSE},
{0, 790, EIF_FALSE},
{0, 791, EIF_FALSE},
{0, 792, EIF_FALSE},
{0, 793, EIF_TRUE},
{0, 794, EIF_FALSE},
{0, 795, EIF_TRUE},
{0, 796, EIF_FALSE},
{0, 797, EIF_FALSE},
{0, 798, EIF_FALSE},
{0, 799, EIF_FALSE},
{0, 800, EIF_FALSE},
{0, 801, EIF_FALSE},
{0, 802, EIF_FALSE},
{0, 803, EIF_FALSE},
{0, 804, EIF_FALSE},
{0, 805, EIF_FALSE},
{0, 806, EIF_FALSE},
{0, 807, EIF_FALSE},
{0, 808, EIF_FALSE},
{0, 809, EIF_FALSE},
{0, 810, EIF_TRUE},
{0, 811, EIF_FALSE},
{0, 812, EIF_TRUE},
{0, 813, EIF_FALSE},
{0, 814, EIF_FALSE},
{0, 815, EIF_TRUE},
{0, 816, EIF_FALSE},
{0, 817, EIF_TRUE},
{0, 818, EIF_FALSE},
{0, 819, EIF_TRUE},
{0, 820, EIF_FALSE},
{0, 821, EIF_FALSE},
{0, 822, EIF_FALSE},
{0, 823, EIF_FALSE},
{0, 824, EIF_FALSE},
{0, 825, EIF_FALSE},
{0, 826, EIF_FALSE},
{0, 827, EIF_FALSE},
{0, 828, EIF_FALSE},
{0, 829, EIF_TRUE},
{0, 830, EIF_FALSE},
{0, 831, EIF_TRUE},
{0, 832, EIF_FALSE},
{0, 833, EIF_FALSE},
{0, 834, EIF_FALSE},
{0, 835, EIF_FALSE},
{0, 836, EIF_FALSE},
{0, 837, EIF_FALSE},
{0, 838, EIF_FALSE},
{0, 839, EIF_FALSE},
{0, 840, EIF_FALSE},
{0, 841, EIF_FALSE},
{0, 842, EIF_TRUE},
{0, 843, EIF_FALSE},
{0, 844, EIF_TRUE},
{0, 845, EIF_FALSE},
{0, 846, EIF_FALSE},
{0, 847, EIF_FALSE},
{0, 848, EIF_FALSE},
{0, 849, EIF_FALSE},
{0, 850, EIF_FALSE},
{0, 851, EIF_FALSE},
{0, 852, EIF_FALSE},
{0, 853, EIF_FALSE},
{0, 854, EIF_TRUE},
{0, 855, EIF_FALSE},
{0, 856, EIF_FALSE},
{0, 857, EIF_FALSE},
{0, 858, EIF_FALSE},
{0, 859, EIF_FALSE},
{0, 860, EIF_FALSE},
{0, 861, EIF_FALSE},
{0, 862, EIF_FALSE},
{0, 863, EIF_FALSE},
{0, 864, EIF_TRUE},
{0, 865, EIF_FALSE},
{0, 866, EIF_FALSE},
{0, 867, EIF_FALSE},
{0, 868, EIF_FALSE},
{0, 869, EIF_FALSE},
{0, 870, EIF_FALSE},
{0, 871, EIF_TRUE},
{0, 872, EIF_FALSE},
{0, 873, EIF_FALSE},
{0, 874, EIF_FALSE},
{0, 875, EIF_FALSE},
{0, 876, EIF_FALSE},
{0, 877, EIF_TRUE},
{0, 878, EIF_FALSE},
{0, 879, EIF_FALSE},
{0, 880, EIF_FALSE},
{0, 881, EIF_FALSE},
{0, 882, EIF_TRUE},
{0, 883, EIF_FALSE},
{0, 884, EIF_FALSE},
{0, 885, EIF_FALSE},
{0, 886, EIF_FALSE},
{0, 887, EIF_FALSE},
{0, 888, EIF_TRUE},
{0, 889, EIF_FALSE},
{0, 890, EIF_TRUE},
{0, 891, EIF_FALSE},
{0, 892, EIF_FALSE},
{0, 893, EIF_FALSE},
{0, 894, EIF_FALSE},
{0, 895, EIF_FALSE},
{0, 896, EIF_FALSE},
{0, 897, EIF_FALSE},
{0, 898, EIF_FALSE},
{0, 899, EIF_FALSE},
{0, 900, EIF_FALSE},
{0, 901, EIF_FALSE},
{0, 902, EIF_TRUE},
{0, 903, EIF_FALSE},
{0, 904, EIF_FALSE},
{0, 905, EIF_FALSE},
{0, 906, EIF_FALSE},
{0, 907, EIF_FALSE},
{0, 908, EIF_FALSE},
{0, 909, EIF_FALSE},
{0, 910, EIF_TRUE},
{0, 911, EIF_FALSE},
{0, 912, EIF_FALSE},
{0, 913, EIF_FALSE},
{0, 914, EIF_TRUE},
{0, 915, EIF_FALSE},
{0, 916, EIF_FALSE},
{0, 917, EIF_TRUE},
{0, 918, EIF_FALSE},
{0, 919, EIF_FALSE},
{0, 920, EIF_FALSE},
{0, 921, EIF_FALSE},
{0, 922, EIF_FALSE},
{0, 923, EIF_FALSE},
{0, 924, EIF_FALSE},
{0, 925, EIF_FALSE},
{0, 926, EIF_FALSE},
{0, 927, EIF_FALSE},
{0, 928, EIF_FALSE},
{0, 929, EIF_FALSE},
{0, 930, EIF_FALSE},
{0, 931, EIF_FALSE},
{0, 932, EIF_FALSE},
{0, 933, EIF_FALSE},
{0, 934, EIF_FALSE},
{0, 935, EIF_FALSE},
{0, 936, EIF_FALSE},
{0, 937, EIF_FALSE},
{0, 938, EIF_FALSE},
{0, 939, EIF_FALSE},
{0, 940, EIF_FALSE},
{0, 941, EIF_FALSE},
{0, 942, EIF_FALSE},
{0, 943, EIF_FALSE},
{0, 944, EIF_FALSE},
{0, 945, EIF_FALSE},
{0, 946, EIF_FALSE},
{0, 947, EIF_FALSE},
{0, 948, EIF_FALSE},
{0, 949, EIF_FALSE},
{0, 950, EIF_FALSE},
{0, 951, EIF_FALSE},
{0, 952, EIF_FALSE},
{0, 953, EIF_FALSE},
{0, 954, EIF_FALSE},
{0, 955, EIF_FALSE},
{0, 956, EIF_FALSE},
{0, 957, EIF_FALSE},
{0, 958, EIF_FALSE},
{0, 959, EIF_FALSE},
{0, 960, EIF_FALSE},
{0, 961, EIF_FALSE},
{0, 962, EIF_FALSE},
{0, 963, EIF_FALSE},
{0, 964, EIF_FALSE},
{0, 965, EIF_FALSE},
{0, 966, EIF_FALSE},
{0, 967, EIF_FALSE},
{0, 968, EIF_FALSE},
{0, 969, EIF_FALSE},
{0, 970, EIF_FALSE},
{0, 971, EIF_FALSE},
{0, 972, EIF_FALSE},
{0, 973, EIF_FALSE},
{0, 974, EIF_FALSE},
{0, 975, EIF_FALSE},
{0, 976, EIF_FALSE},
{0, 977, EIF_TRUE},
{0, 978, EIF_FALSE},
{0, 979, EIF_FALSE},
{0, 980, EIF_FALSE},
{0, 981, EIF_FALSE},
{0, 982, EIF_FALSE},
{0, 983, EIF_FALSE},
{0, 984, EIF_FALSE},
{0, 985, EIF_FALSE},
{0, 986, EIF_FALSE},
{0, 987, EIF_FALSE},
{0, 988, EIF_FALSE},
{0, 989, EIF_FALSE},
{0, 990, EIF_FALSE},
{0, 991, EIF_FALSE},
{0, 992, EIF_FALSE},
{0, 993, EIF_FALSE},
{0, 994, EIF_FALSE},
{0, 995, EIF_FALSE},
{0, 996, EIF_FALSE},
{0, 997, EIF_FALSE},
{0, 998, EIF_FALSE},
{0, 999, EIF_FALSE},
{0, 1000, EIF_FALSE},
{0, 1001, EIF_FALSE},
{0, 1002, EIF_FALSE},
{0, 1003, EIF_FALSE},
{0, 1004, EIF_FALSE},
{0, 1005, EIF_FALSE},
{0, 1006, EIF_FALSE},
{0, 1007, EIF_FALSE},
{0, 1008, EIF_FALSE},
{0, 1009, EIF_FALSE},
{0, 1010, EIF_FALSE},
{0, 1011, EIF_FALSE},
{0, 1012, EIF_FALSE},
{0, 1013, EIF_FALSE},
{0, 1014, EIF_FALSE},
{0, 1015, EIF_TRUE},
{0, 1016, EIF_FALSE},
{0, 1017, EIF_FALSE},
{0, 1018, EIF_FALSE},
{0, 1019, EIF_FALSE},
{0, 1020, EIF_FALSE},
{0, 1021, EIF_FALSE},
{0, 1022, EIF_FALSE},
{0, 1023, EIF_FALSE},
{0, 1024, EIF_FALSE},
{0, 1025, EIF_FALSE},
{0, 1026, EIF_FALSE},
{0, 1027, EIF_FALSE},
{0, 1028, EIF_FALSE},
{0, 1029, EIF_FALSE},
{0, 1030, EIF_FALSE},
{0, 1031, EIF_FALSE},
{0, 1032, EIF_TRUE},
{0, 1033, EIF_FALSE},
{0, 1034, EIF_FALSE},
{0, 1035, EIF_FALSE},
{0, 1036, EIF_FALSE},
{0, 1037, EIF_FALSE},
{0, 1038, EIF_FALSE},
{0, 1039, EIF_FALSE},
{0, 1040, EIF_FALSE},
{0, 1041, EIF_FALSE},
{0, 1042, EIF_FALSE},
{0, 1043, EIF_FALSE},
{0, 1044, EIF_FALSE},
{0, 1045, EIF_FALSE},
{0, 1046, EIF_FALSE},
{0, 1047, EIF_FALSE},
{0, 1048, EIF_FALSE},
{0, 1049, EIF_FALSE},
{0, 1050, EIF_FALSE},
{0, 1051, EIF_FALSE},
{0, 1052, EIF_FALSE},
{0, 1053, EIF_FALSE},
{0, 1054, EIF_FALSE},
{0, 1055, EIF_FALSE},
{0, 1056, EIF_FALSE},
{0, 1057, EIF_FALSE},
{0, 1058, EIF_FALSE},
{0, 1059, EIF_FALSE},
{0, 1060, EIF_FALSE},
{0, 1061, EIF_FALSE},
{0, 1062, EIF_FALSE},
{0, 1063, EIF_TRUE},
{0, 1064, EIF_FALSE},
{0, 1065, EIF_FALSE},
{0, 1066, EIF_FALSE},
{0, 1067, EIF_FALSE},
{0, 1068, EIF_TRUE},
{0, 1069, EIF_FALSE},
{0, 1070, EIF_FALSE},
{0, 1071, EIF_FALSE},
{0, 1072, EIF_FALSE},
{0, 1073, EIF_FALSE},
{0, 1074, EIF_FALSE},
{0, 1075, EIF_FALSE},
{0, 1076, EIF_FALSE},
{0, 1077, EIF_FALSE},
{0, 1078, EIF_FALSE},
{0, 1079, EIF_FALSE},
{0, 1080, EIF_FALSE},
{0, 1081, EIF_FALSE},
{0, 1082, EIF_FALSE},
{0, 1083, EIF_FALSE},
{0, 1084, EIF_FALSE},
{0, 1085, EIF_FALSE},
{0, 1086, EIF_FALSE},
{0, 1087, EIF_FALSE},
{0, 1088, EIF_FALSE},
{0, 1089, EIF_FALSE},
{0, 1090, EIF_FALSE},
{0, 1091, EIF_FALSE},
{0, 1092, EIF_FALSE},
{0, 1093, EIF_FALSE},
{0, 1094, EIF_FALSE},
{0, 1095, EIF_FALSE},
{0, 1096, EIF_FALSE},
{0, 1097, EIF_FALSE},
{0, 1098, EIF_FALSE},
{0, 1099, EIF_FALSE},
{0, 1100, EIF_FALSE},
{0, 1101, EIF_FALSE},
{0, 1102, EIF_FALSE},
{0, 1103, EIF_FALSE},
{0, 1104, EIF_FALSE},
{0, 1105, EIF_FALSE},
{0, 1106, EIF_FALSE},
{0, 1107, EIF_FALSE},
{0, 1108, EIF_FALSE},
{0, 1109, EIF_FALSE},
{0, 1110, EIF_FALSE},
{0, 1111, EIF_FALSE},
{0, 1112, EIF_FALSE},
{0, 1113, EIF_FALSE},
{0, 1114, EIF_FALSE},
{0, 1115, EIF_FALSE},
{0, 1116, EIF_FALSE},
{0, 1117, EIF_FALSE},
{0, 1118, EIF_FALSE},
{0, 1119, EIF_FALSE},
{0, 1120, EIF_FALSE},
{0, 1121, EIF_FALSE},
{0, 1122, EIF_FALSE},
{0, 1123, EIF_FALSE},
{0, 1124, EIF_FALSE},
{0, 1125, EIF_FALSE},
{0, 1126, EIF_FALSE},
{0, 1127, EIF_FALSE},
{0, 1128, EIF_FALSE},
{0, 1129, EIF_FALSE},
{0, 1130, EIF_FALSE},
{0, 1131, EIF_FALSE},
{0, 1132, EIF_FALSE},
{0, 1133, EIF_FALSE},
{0, 1134, EIF_FALSE},
{0, 1135, EIF_FALSE},
{0, 1136, EIF_FALSE},
{0, 1137, EIF_FALSE},
{0, 1138, EIF_FALSE},
{0, 1139, EIF_FALSE},
{0, 1140, EIF_FALSE},
{0, 1141, EIF_FALSE},
{0, 1142, EIF_FALSE},
{0, 1143, EIF_FALSE},
{0, 1144, EIF_FALSE},
{0, 1145, EIF_FALSE},
{0, 1146, EIF_FALSE},
{0, 1147, EIF_FALSE},
{0, 1148, EIF_FALSE},
{0, 1149, EIF_FALSE},
{0, 1150, EIF_FALSE},
{0, 1151, EIF_FALSE},
{0, 1152, EIF_FALSE},
{0, 1153, EIF_FALSE},
{0, 1154, EIF_FALSE},
{0, 1155, EIF_FALSE},
{0, 1156, EIF_FALSE},
{0, 1157, EIF_FALSE},
{0, 1158, EIF_FALSE},
{0, 1159, EIF_FALSE},
{0, 1160, EIF_FALSE},
{0, 1161, EIF_FALSE},
{0, 1162, EIF_FALSE},
{0, 1163, EIF_FALSE},
{0, 1164, EIF_FALSE},
{0, 1165, EIF_FALSE},
{0, 1166, EIF_FALSE},
{0, 1167, EIF_FALSE},
{0, 1168, EIF_FALSE},
{0, 1169, EIF_FALSE},
{0, 1170, EIF_FALSE},
{0, 1171, EIF_FALSE},
{0, 1172, EIF_FALSE},
{0, 1173, EIF_FALSE},
{0, 1174, EIF_FALSE},
{0, 1175, EIF_FALSE},
{0, 1176, EIF_FALSE},
{0, 1177, EIF_FALSE},
{0, 1178, EIF_FALSE},
{0, 1179, EIF_FALSE},
{0, 1180, EIF_FALSE},
{0, 1181, EIF_FALSE},
{0, 1182, EIF_FALSE},
{0, 1183, EIF_FALSE},
{0, 1184, EIF_FALSE},
{0, 1185, EIF_FALSE},
{0, 1186, EIF_FALSE},
{0, 1187, EIF_FALSE},
{0, 1188, EIF_FALSE},
{0, 1189, EIF_FALSE},
{0, 1190, EIF_FALSE},
{0, 1191, EIF_FALSE},
{0, 1192, EIF_FALSE},
{0, 1193, EIF_FALSE},
{0, 1194, EIF_FALSE},
{0, 1195, EIF_FALSE},
{0, 1196, EIF_FALSE},
{0, 1197, EIF_FALSE},
{0, 1198, EIF_FALSE},
{0, 1199, EIF_FALSE},
{0, 1200, EIF_FALSE},
{0, 1201, EIF_FALSE},
{0, 1202, EIF_FALSE},
{0, 1203, EIF_FALSE},
{0, 1204, EIF_FALSE},
{0, 1205, EIF_FALSE},
{0, 1206, EIF_FALSE},
{0, 1207, EIF_FALSE},
{0, 1208, EIF_FALSE},
{0, 1209, EIF_TRUE},
{0, 1210, EIF_FALSE},
{0, 1211, EIF_FALSE},
{0, 1212, EIF_FALSE},
{0, 1213, EIF_FALSE},
{0, 1214, EIF_FALSE},
{0, 1215, EIF_FALSE},
{0, 1216, EIF_FALSE},
{0, 1217, EIF_FALSE},
{0, 1218, EIF_FALSE},
{0, 1219, EIF_FALSE},
{0, 1220, EIF_FALSE},
{0, 1221, EIF_FALSE},
{0, 1222, EIF_FALSE},
{0, 1223, EIF_FALSE},
{0, 1224, EIF_FALSE},
{0, 1225, EIF_FALSE},
{0, 1226, EIF_FALSE},
{0, 1227, EIF_FALSE},
{0, 1228, EIF_FALSE},
{0, 1229, EIF_FALSE},
{0, 1230, EIF_FALSE},
{0, 1231, EIF_FALSE},
{0, 1232, EIF_FALSE},
{0, 1233, EIF_FALSE},
{0, 1234, EIF_FALSE},
{0, 1235, EIF_FALSE},
{0, 1236, EIF_FALSE},
{0, 1237, EIF_FALSE},
{0, 1238, EIF_FALSE},
{0, 1239, EIF_FALSE},
{0, 1240, EIF_FALSE},
{0, 1241, EIF_FALSE},
{0, 1242, EIF_FALSE},
{0, 1243, EIF_FALSE},
{0, 1244, EIF_FALSE},
{0, 1245, EIF_FALSE},
{0, 1246, EIF_FALSE},
{0, 1247, EIF_FALSE},
{0, 1248, EIF_FALSE},
{0, 1249, EIF_FALSE},
{0, 1250, EIF_TRUE},
{0, 1251, EIF_FALSE},
{0, 1252, EIF_FALSE},
{0, 1253, EIF_FALSE},
{0, 1254, EIF_FALSE},
{0, 1255, EIF_FALSE},
{0, 1256, EIF_FALSE},
{0, 1257, EIF_FALSE},
{0, 1258, EIF_FALSE},
{0, 1259, EIF_TRUE},
{0, 1260, EIF_FALSE},
{0, 1261, EIF_FALSE},
{0, 1262, EIF_FALSE},
{0, 1263, EIF_FALSE},
{0, 1264, EIF_FALSE},
{0, 1265, EIF_FALSE},
{0, 1266, EIF_FALSE},
{0, 1267, EIF_FALSE},
{0, 1268, EIF_FALSE},
{0, 1269, EIF_FALSE},
{0, 1270, EIF_FALSE},
{0, 1271, EIF_FALSE},
{0, 1272, EIF_FALSE},
{0, 1273, EIF_FALSE},
{0, 1274, EIF_FALSE},
{0, 1275, EIF_FALSE},
{0, 1276, EIF_FALSE},
{0, 1277, EIF_FALSE},
{0, 1278, EIF_FALSE},
{0, 1279, EIF_FALSE},
{0, 1280, EIF_FALSE},
{0, 1281, EIF_FALSE},
{0, 1282, EIF_FALSE},
{0, 1283, EIF_FALSE},
{0, 1284, EIF_FALSE},
{0, 1285, EIF_FALSE},
{0, 1286, EIF_FALSE},
{0, 1287, EIF_FALSE},
{0, 1288, EIF_FALSE},
{0, 1289, EIF_FALSE},
{0, 1290, EIF_TRUE},
{0, 1291, EIF_FALSE},
{0, 1292, EIF_FALSE},
{0, 1293, EIF_FALSE},
{0, 1294, EIF_FALSE},
{0, 1295, EIF_FALSE},
{0, 1296, EIF_FALSE},
{0, 1297, EIF_FALSE},
{0, 1298, EIF_FALSE},
{0, 1299, EIF_FALSE},
{0, 1300, EIF_FALSE},
{0, 1301, EIF_FALSE},
{0, 1302, EIF_FALSE},
{0, 1303, EIF_FALSE},
{0, 1304, EIF_FALSE},
{0, 1305, EIF_FALSE},
{0, 1306, EIF_FALSE},
{0, 1307, EIF_FALSE},
{0, 1308, EIF_FALSE},
{0, 1309, EIF_FALSE},
{0, 1310, EIF_FALSE},
{0, 1311, EIF_FALSE},
{0, 1312, EIF_TRUE},
{0, 1313, EIF_FALSE},
{0, 1314, EIF_FALSE},
{0, 1315, EIF_FALSE},
{0, 1316, EIF_FALSE},
{0, 1317, EIF_FALSE},
{0, 1318, EIF_FALSE},
{0, 1319, EIF_FALSE},
{0, 1320, EIF_FALSE},
{0, 1321, EIF_FALSE},
{0, 1322, EIF_FALSE},
{0, 1323, EIF_FALSE},
{0, 1324, EIF_FALSE},
{0, 1325, EIF_FALSE},
{0, 1326, EIF_FALSE},
{0, 1327, EIF_FALSE},
{0, 1328, EIF_FALSE},
{0, 1329, EIF_FALSE},
{0, 1330, EIF_FALSE},
{0, 1331, EIF_FALSE},
{0, 1332, EIF_FALSE},
{0, 1333, EIF_FALSE},
{0, 1334, EIF_FALSE},
{0, 1335, EIF_FALSE},
{0, 1336, EIF_FALSE},
{0, 1337, EIF_FALSE},
{0, 1338, EIF_FALSE},
{0, 1339, EIF_FALSE},
{0, 1340, EIF_FALSE},
{0, 1341, EIF_FALSE},
{0, 1342, EIF_FALSE},
{0, 1343, EIF_FALSE},
{0, 1344, EIF_FALSE},
{0, 1345, EIF_FALSE},
{0, 1346, EIF_FALSE},
{0, 1347, EIF_TRUE},
{0, 1348, EIF_TRUE},
{0, 1349, EIF_TRUE},
{0, 1350, EIF_FALSE},
{0, 1351, EIF_FALSE},
{0, 1352, EIF_TRUE},
{0, 1353, EIF_FALSE},
{0, 1354, EIF_FALSE},
{0, 1355, EIF_FALSE},
{0, 1356, EIF_FALSE},
{0, 1357, EIF_FALSE},
{0, 1358, EIF_FALSE},
{0, 1359, EIF_FALSE},
{0, 1360, EIF_TRUE},
{0, 1361, EIF_FALSE},
{0, 1362, EIF_FALSE},
{0, 1363, EIF_FALSE},
{0, 1364, EIF_FALSE},
{0, 1365, EIF_FALSE},
{0, 1366, EIF_FALSE},
{0, 1367, EIF_FALSE},
{0, 1368, EIF_FALSE},
{0, 1369, EIF_FALSE},
{0, 1370, EIF_TRUE},
{0, 1371, EIF_FALSE},
{0, 1372, EIF_FALSE},
{0, 1373, EIF_FALSE},
{0, 1374, EIF_FALSE},
{0, 1375, EIF_FALSE},
{0, 1376, EIF_FALSE},
{0, 1377, EIF_FALSE},
{0, 1378, EIF_TRUE},
{0, 1379, EIF_FALSE},
{0, 1380, EIF_TRUE},
{0, 1381, EIF_FALSE},
{0, 1382, EIF_FALSE},
{0, 1383, EIF_TRUE},
{0, 1384, EIF_FALSE},
{0, 1385, EIF_FALSE},
{0, 1386, EIF_FALSE},
{0, 1387, EIF_FALSE},
{0, 1388, EIF_FALSE},
{0, 1389, EIF_FALSE},
{0, 1390, EIF_FALSE},
{0, 1391, EIF_FALSE},
{0, 1392, EIF_TRUE},
{0, 1393, EIF_FALSE},
{0, 1394, EIF_FALSE},
{0, 1395, EIF_FALSE},
{0, 1396, EIF_FALSE},
{0, 1397, EIF_FALSE},
{0, 1398, EIF_FALSE},
{0, 1399, EIF_FALSE},
{0, 1400, EIF_FALSE},
{0, 1401, EIF_FALSE},
{0, 1402, EIF_FALSE},
{0, 1403, EIF_FALSE},
{0, 1404, EIF_FALSE},
{0, 1405, EIF_FALSE},
{0, 1406, EIF_FALSE},
{0, 1407, EIF_FALSE},
{0, 1408, EIF_FALSE},
{0, 1409, EIF_FALSE},
{0, 1410, EIF_FALSE},
{0, 1411, EIF_FALSE},
{0, 1412, EIF_FALSE},
{0, 1413, EIF_FALSE},
{0, 1414, EIF_FALSE},
{0, 1415, EIF_FALSE},
{0, 1416, EIF_FALSE},
{0, 1417, EIF_FALSE},
{0, 1418, EIF_FALSE},
{0, 1419, EIF_FALSE},
{0, 1420, EIF_FALSE},
{0, 1421, EIF_FALSE},
{0, 1422, EIF_FALSE},
{0, 1423, EIF_FALSE},
{0, 1424, EIF_FALSE},
{0, 1425, EIF_FALSE},
{0, 1426, EIF_FALSE},
{0, 1427, EIF_FALSE},
{0, 1428, EIF_TRUE},
{0, 1429, EIF_FALSE},
{0, 1430, EIF_FALSE},
{0, 1431, EIF_FALSE},
{0, 1432, EIF_FALSE},
{0, 1433, EIF_FALSE},
{0, 1434, EIF_FALSE},
{0, 1435, EIF_FALSE},
{0, 1436, EIF_FALSE},
{0, 1437, EIF_FALSE},
{0, 1438, EIF_FALSE},
{0, 1439, EIF_FALSE},
{0, 1440, EIF_FALSE},
{0, 1441, EIF_FALSE},
{0, 1442, EIF_FALSE},
{0, 1443, EIF_FALSE},
{0, 1444, EIF_FALSE},
{0, 1445, EIF_FALSE},
{0, 1446, EIF_FALSE},
{0, 1447, EIF_FALSE},
{0, 1448, EIF_FALSE},
{0, 1449, EIF_TRUE},
{0, 1450, EIF_FALSE},
{0, 1451, EIF_FALSE},
{0, 1452, EIF_FALSE},
{0, 1453, EIF_TRUE},
{0, 1454, EIF_FALSE},
{0, 1455, EIF_FALSE},
{0, 1456, EIF_FALSE},
{0, 1457, EIF_FALSE},
{0, 1458, EIF_FALSE},
{0, 1459, EIF_FALSE},
{0, 1460, EIF_FALSE},
{0, 1461, EIF_FALSE},
{0, 1462, EIF_FALSE},
{0, 1463, EIF_FALSE},
{0, 1464, EIF_FALSE},
{0, 1465, EIF_FALSE},
{0, 1466, EIF_FALSE},
{0, 1467, EIF_FALSE},
{0, 1468, EIF_FALSE},
{0, 1469, EIF_FALSE},
{0, 1470, EIF_FALSE},
{0, 1471, EIF_FALSE},
{0, 1472, EIF_FALSE},
{0, 1473, EIF_FALSE},
{0, 1474, EIF_FALSE},
{0, 1475, EIF_FALSE},
{0, 1476, EIF_FALSE},
{0, 1477, EIF_FALSE},
{0, 1478, EIF_FALSE},
{0, 1479, EIF_FALSE},
{0, 1480, EIF_FALSE},
{0, 1481, EIF_FALSE},
{0, 1482, EIF_FALSE},
{0, 1483, EIF_FALSE},
{0, 1484, EIF_FALSE},
{0, 1485, EIF_FALSE},
{0, 1486, EIF_FALSE},
{0, 1487, EIF_TRUE},
{0, 1488, EIF_FALSE},
{0, 1489, EIF_FALSE},
{0, 1490, EIF_FALSE},
{0, 1491, EIF_FALSE},
{0, 1492, EIF_FALSE},
{0, 1493, EIF_FALSE},
{0, 1494, EIF_FALSE},
{0, 1495, EIF_FALSE},
{0, 1496, EIF_FALSE},
{0, 1497, EIF_FALSE},
{0, 1498, EIF_FALSE},
{0, 1499, EIF_FALSE},
{0, 1500, EIF_FALSE},
{0, 1501, EIF_FALSE},
{0, 1502, EIF_FALSE}
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
