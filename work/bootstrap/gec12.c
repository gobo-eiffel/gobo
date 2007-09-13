#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
T0* T1198f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T1198f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.default_message */
T0* T1000f5(T0* C)
{
	T0* R = 0;
	R = (T1000f3(C, ge231ov3850));
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.message */
T0* T1000f3(T0* C, T0* a1)
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
	t1 = (T1000f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T1000f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1000f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T1000f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T1000*)(C))->a1, l3));
						if (t2) {
							t1 = (T1000f4(C));
							t5 = (T86f5(((T1000*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1000f4(C));
								t5 = (T1000f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T1000f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T1000f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* UT_TOO_MANY_INCLUDES_ERROR.arguments */
T0* T1000f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.string_ */
T0* T1000f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T999f5(T0* C)
{
	T0* R = 0;
	R = (T999f3(C, ge230ov3850));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T999f3(T0* C, T0* a1)
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
	t1 = (T999f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T999f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T999f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T999f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T999*)(C))->a1, l3));
						if (t2) {
							t1 = (T999f4(C));
							t5 = (T86f5(((T999*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T999f4(C));
								t5 = (T999f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T999f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T999f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* UT_SYNTAX_ERROR.arguments */
T0* T999f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T999f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T929f5(T0* C)
{
	T0* R = 0;
	R = (T929f3(C, ge1009ov3850));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T929f3(T0* C, T0* a1)
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
	t1 = (T929f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T929f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T929f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T929f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T929*)(C))->a1, l3));
						if (t2) {
							t1 = (T929f4(C));
							t5 = (T86f5(((T929*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T929f4(C));
								t5 = (T929f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T929f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T929f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T929f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T929f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T928f5(T0* C)
{
	T0* R = 0;
	R = (T928f3(C, ge1025ov3850));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T928f3(T0* C, T0* a1)
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
	t1 = (T928f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T928f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T928f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T928f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T928*)(C))->a1, l3));
						if (t2) {
							t1 = (T928f4(C));
							t5 = (T86f5(((T928*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T928f4(C));
								t5 = (T928f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T928f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T928f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
T0* T928f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T928f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T927f5(T0* C)
{
	T0* R = 0;
	R = (T927f3(C, ge1022ov3850));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T927f3(T0* C, T0* a1)
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
	t1 = (T927f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T927f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T927f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T927f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T927*)(C))->a1, l3));
						if (t2) {
							t1 = (T927f4(C));
							t5 = (T86f5(((T927*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T927f4(C));
								t5 = (T927f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T927f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T927f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
T0* T927f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T927f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T926f5(T0* C)
{
	T0* R = 0;
	R = (T926f3(C, ge1021ov3850));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T926f3(T0* C, T0* a1)
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
	t1 = (T926f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T926f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T926f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T926f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T926*)(C))->a1, l3));
						if (t2) {
							t1 = (T926f4(C));
							t5 = (T86f5(((T926*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T926f4(C));
								t5 = (T926f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T926f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T926f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
T0* T926f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T926f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T925f5(T0* C)
{
	T0* R = 0;
	R = (T925f3(C, ge1017ov3850));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T925f3(T0* C, T0* a1)
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
	t1 = (T925f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T925f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T925f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T925f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T925*)(C))->a1, l3));
						if (t2) {
							t1 = (T925f4(C));
							t5 = (T86f5(((T925*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T925f4(C));
								t5 = (T925f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T925f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T925f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
T0* T925f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T925f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T924f5(T0* C)
{
	T0* R = 0;
	R = (T924f3(C, ge1024ov3850));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T924f3(T0* C, T0* a1)
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
	t1 = (T924f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T924f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T924f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T924f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T924*)(C))->a1, l3));
						if (t2) {
							t1 = (T924f4(C));
							t5 = (T86f5(((T924*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T924f4(C));
								t5 = (T924f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T924f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T924f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
T0* T924f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T924f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T923f5(T0* C)
{
	T0* R = 0;
	R = (T923f3(C, ge1016ov3850));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T923f3(T0* C, T0* a1)
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
	t1 = (T923f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T923f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T923f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T923f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T923*)(C))->a1, l3));
						if (t2) {
							t1 = (T923f4(C));
							t5 = (T86f5(((T923*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T923f4(C));
								t5 = (T923f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T923f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T923f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
T0* T923f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T923f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T922f5(T0* C)
{
	T0* R = 0;
	R = (T922f3(C, ge1028ov3850));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T922f3(T0* C, T0* a1)
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
	t1 = (T922f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T922f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T922f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T922f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T922*)(C))->a1, l3));
						if (t2) {
							t1 = (T922f4(C));
							t5 = (T86f5(((T922*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T922f4(C));
								t5 = (T922f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T922f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T922f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
T0* T922f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T922f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_SYNTAX_ERROR.default_message */
T0* T919f17(T0* C)
{
	T0* R = 0;
	R = (T919f19(C, ((T919*)(C))->a1));
	return R;
}

/* ET_SYNTAX_ERROR.message */
T0* T919f19(T0* C, T0* a1)
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
	t1 = (T919f15(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T919f15(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T919f15(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T919f15(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T919*)(C))->a2, l3));
						if (t2) {
							t1 = (T919f15(C));
							t5 = (T86f5(((T919*)(C))->a2, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T919f15(C));
								t5 = (T919f18(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T919f15(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T919f15(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T919f18(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_SYNTAX_ERROR.string_ */
T0* T919f15(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_CLUSTER_ERROR.default_message */
T0* T918f12(T0* C)
{
	T0* R = 0;
	R = (T918f7(C, ((T918*)(C))->a1));
	return R;
}

/* ET_CLUSTER_ERROR.message */
T0* T918f7(T0* C, T0* a1)
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
	t1 = (T918f9(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T918f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T918f9(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T918f9(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T918*)(C))->a2, l3));
						if (t2) {
							t1 = (T918f9(C));
							t5 = (T86f5(((T918*)(C))->a2, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T918f9(C));
								t5 = (T918f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T918f9(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T918f9(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T918f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_CLUSTER_ERROR.string_ */
T0* T918f9(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_VALIDITY_ERROR.default_message */
T0* T917f60(T0* C)
{
	T0* R = 0;
	R = (T917f18(C, ((T917*)(C))->a5));
	return R;
}

/* ET_VALIDITY_ERROR.message */
T0* T917f18(T0* C, T0* a1)
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
	t1 = (T917f59(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T917f59(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T917f59(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T917f59(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T917*)(C))->a6, l3));
						if (t2) {
							t1 = (T917f59(C));
							t5 = (T86f5(((T917*)(C))->a6, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T917f59(C));
								t5 = (T917f62(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T917f59(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T917f59(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T917f62(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_VALIDITY_ERROR.string_ */
T0* T917f59(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_INTERNAL_ERROR.default_message */
T0* T916f5(T0* C)
{
	T0* R = 0;
	R = (T916f7(C, ((T916*)(C))->a1));
	return R;
}

/* ET_INTERNAL_ERROR.message */
T0* T916f7(T0* C, T0* a1)
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
	t1 = (T916f9(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T916f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T916f9(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T916f9(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T916*)(C))->a2, l3));
						if (t2) {
							t1 = (T916f9(C));
							t5 = (T86f5(((T916*)(C))->a2, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T916f9(C));
								t5 = (T916f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T916f9(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T916f9(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T916f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_INTERNAL_ERROR.string_ */
T0* T916f9(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_SYSTEM_ERROR.default_message */
T0* T915f5(T0* C)
{
	T0* R = 0;
	R = (T915f7(C, ((T915*)(C))->a1));
	return R;
}

/* ET_SYSTEM_ERROR.message */
T0* T915f7(T0* C, T0* a1)
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
	t1 = (T915f9(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T915f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T915f9(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T915f9(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T915*)(C))->a2, l3));
						if (t2) {
							t1 = (T915f9(C));
							t5 = (T86f5(((T915*)(C))->a2, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T915f9(C));
								t5 = (T915f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T915f9(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T915f9(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T915f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_SYSTEM_ERROR.string_ */
T0* T915f9(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T287f5(T0* C)
{
	T0* R = 0;
	R = (T287f3(C, ge1012ov3850));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T287f3(T0* C, T0* a1)
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
	t1 = (T287f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T287f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T287f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T287f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T287*)(C))->a1, l3));
						if (t2) {
							t1 = (T287f4(C));
							t5 = (T86f5(((T287*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T287f4(C));
								t5 = (T287f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T287f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T287f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T287f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T287f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T286f5(T0* C)
{
	T0* R = 0;
	R = (T286f3(C, ge1023ov3850));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T286f3(T0* C, T0* a1)
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
	t1 = (T286f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T286f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T286f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T286f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T286*)(C))->a1, l3));
						if (t2) {
							t1 = (T286f4(C));
							t5 = (T86f5(((T286*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T286f4(C));
								t5 = (T286f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T286f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T286f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T286f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T286f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T285f5(T0* C)
{
	T0* R = 0;
	R = (T285f3(C, ge1027ov3850));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T285f3(T0* C, T0* a1)
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
	t1 = (T285f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T285f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T285f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T285f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T285*)(C))->a1, l3));
						if (t2) {
							t1 = (T285f4(C));
							t5 = (T86f5(((T285*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T285f4(C));
								t5 = (T285f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T285f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T285f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T285f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T284f5(T0* C)
{
	T0* R = 0;
	R = (T284f3(C, ge1019ov3850));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T284f3(T0* C, T0* a1)
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
	t1 = (T284f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T284f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T284f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T284f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T284*)(C))->a1, l3));
						if (t2) {
							t1 = (T284f4(C));
							t5 = (T86f5(((T284*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T284f4(C));
								t5 = (T284f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T284f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T284f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T284f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T284f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T283f5(T0* C)
{
	T0* R = 0;
	R = (T283f3(C, ge1010ov3850));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T283f3(T0* C, T0* a1)
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
	t1 = (T283f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T283f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T283f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T283f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T283*)(C))->a1, l3));
						if (t2) {
							t1 = (T283f4(C));
							t5 = (T86f5(((T283*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T283f4(C));
								t5 = (T283f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T283f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T283f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T283f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T283f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T212f2(T0* C)
{
	T0* R = 0;
	R = (T212f4(C, ge225ov3850));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T212f4(T0* C, T0* a1)
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
	t1 = (T212f5(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T212f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T212f5(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T212f5(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T212*)(C))->a1, l3));
						if (t2) {
							t1 = (T212f5(C));
							t5 = (T86f5(((T212*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T212f5(C));
								t5 = (T212f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T212f5(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T212f5(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T212f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T212f5(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T113f5(T0* C)
{
	T0* R = 0;
	R = (T113f3(C, ge228ov3850));
	return R;
}

/* UT_MESSAGE.message */
T0* T113f3(T0* C, T0* a1)
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
	t1 = (T113f4(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T113f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T113f4(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T113f4(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T113*)(C))->a1, l3));
						if (t2) {
							t1 = (T113f4(C));
							t5 = (T86f5(((T113*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T113f4(C));
								t5 = (T113f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T113f4(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T113f4(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T113f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T113f4(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T68f2(T0* C)
{
	T0* R = 0;
	R = (T68f4(C, ge235ov3850));
	return R;
}

/* UT_VERSION_NUMBER.message */
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
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T68f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T68f5(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T68f5(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T68*)(C))->a1, l3));
						if (t2) {
							t1 = (T68f5(C));
							t5 = (T86f5(((T68*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T68f5(C));
								t5 = (T68f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T68f5(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T68f5(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T68f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T68f5(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T67f2(T0* C)
{
	T0* R = 0;
	R = (T67f4(C, ge224ov3850));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T67f4(T0* C, T0* a1)
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
	t1 = (T67f5(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T67f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T67f5(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T67f5(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T67*)(C))->a1, l3));
						if (t2) {
							t1 = (T67f5(C));
							t5 = (T86f5(((T67*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T67f5(C));
								t5 = (T67f6(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T67f5(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T67f5(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T67f6(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T67f5(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* AP_ERROR.default_message */
T0* T32f14(T0* C)
{
	T0* R = 0;
	R = (T32f15(C, ((T32*)(C))->a2));
	return R;
}

/* AP_ERROR.message */
T0* T32f15(T0* C, T0* a1)
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
	t1 = (T32f16(C));
	R = (T26f7(t1, a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f12(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, l5);
				} else {
					T939f58(R, l5);
				}
			} else {
				t1 = (T32f16(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(R))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T939f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f12(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(R))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T939f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T32f16(C));
					l1 = (T26f7(t1, a1, (T6)(GE_int32(5))));
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
							l5 = (T17f12(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(l1))->id==17) {
										T17f39(l1, l5);
									} else {
										T939f58(l1, l5);
									}
								} else {
									t1 = (T32f16(C));
									T26f20(t1, l1, a1, l2, l2);
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
							l5 = (T17f12(a1, l2));
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
								if (((T0*)(l1))->id==17) {
									T17f39(l1, l5);
								} else {
									T939f58(l1, l5);
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
					t2 = (((((T0*)(l1))->id==17)?T17f23(l1):T939f34(l1)));
					if (t2) {
						l3 = (((((T0*)(l1))->id==17)?T17f16(l1):T939f35(l1)));
						t2 = (T86f4(((T32*)(C))->a1, l3));
						if (t2) {
							t1 = (T32f16(C));
							t5 = (T86f5(((T32*)(C))->a1, l3));
							R = (T26f8(t1, R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T32f16(C));
								t5 = (T32f17(C));
								t5 = (((T23*)(t5))->a1);
								R = (T26f8(t1, R, t5));
							} else {
								if (((T0*)(R))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T939f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T939f58(R, (T2)('{'));
									}
								}
								t1 = (T32f16(C));
								R = (T26f8(t1, R, l1));
								if (l8) {
									if (((T0*)(R))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T939f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(R))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T939f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T939f58(R, (T2)('{'));
							}
						}
						t1 = (T32f16(C));
						R = (T26f8(t1, R, l1));
						if (l8) {
							if (((T0*)(R))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T939f58(R, (T2)('}'));
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
T0* T32f17(T0* C)
{
	T0* R = 0;
	if (ge324os1582) {
		return ge324ov1582;
	} else {
		ge324os1582 = '\1';
	}
	R = T23c4();
	ge324ov1582 = R;
	return R;
}

/* AP_ERROR.string_ */
T0* T32f16(T0* C)
{
	T0* R = 0;
	if (ge278os1590) {
		return ge278ov1590;
	} else {
		ge278os1590 = '\1';
	}
	R = T26c19();
	ge278ov1590 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T41f23(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T41*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.was_found */
T1 T37f14(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T37f10(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.occurrences */
T6 T37f10(T0* C)
{
	T6 R = 0;
	R = (((T80*)(((T37*)(C))->a1))->a1);
	return R;
}

/* AP_INTEGER_OPTION.was_found */
T1 T36f12(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T36f11(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.occurrences */
T6 T36f11(T0* C)
{
	T6 R = 0;
	R = (((T92*)(((T36*)(C))->a1))->a1);
	return R;
}

/* AP_BOOLEAN_OPTION.was_found */
T1 T35f13(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T35f12(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.occurrences */
T6 T35f12(T0* C)
{
	T6 R = 0;
	R = (((T89*)(((T35*)(C))->a1))->a1);
	return R;
}

/* AP_FLAG.was_found */
T1 T33f11(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T33*)(C))->a1), (T6)(GE_int32(0))));
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T41f19(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_ENUMERATION_OPTION.needs_parameter */
T1 T37f13(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_INTEGER_OPTION.needs_parameter */
T1 T36f14(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.needs_parameter */
T1 T35f11(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T33f10(T0* C)
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
		t3 = (T17f9(t3, t4));
		R = (T17f9(t3, ((T41*)(C))->a4));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T41*)(C))->a2)));
		R = (T17f9(t3, t4));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.name */
T0* T37f11(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T37f12(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(t3, t4));
		R = (T17f9(t3, ((T37*)(C))->a5));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T37*)(C))->a8)));
		R = (T17f9(t3, t4));
	}
	return R;
}

/* AP_INTEGER_OPTION.name */
T0* T36f10(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T36f13(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(t3, t4));
		R = (T17f9(t3, ((T36*)(C))->a2));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T36*)(C))->a3)));
		R = (T17f9(t3, t4));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.name */
T0* T35f9(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T35f10(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(t3, t4));
		R = (T17f9(t3, ((T35*)(C))->a4));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T35*)(C))->a7)));
		R = (T17f9(t3, t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T33f8(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T33f9(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(t3, t4));
		R = (T17f9(t3, ((T33*)(C))->a3));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T33*)(C))->a4)));
		R = (T17f9(t3, t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T41f24(T0* C)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f39(R, (T2)('['));
	}
	T17f39(R, (T2)('-'));
	if (((T41*)(C))->a3) {
		t2 = (T2f1(&(((T41*)(C))->a2)));
		T17f41(R, t2);
	} else {
		T17f39(R, (T2)('-'));
		T17f41(R, ((T41*)(C))->a4);
	}
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f39(R, (T2)(']'));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.example */
T0* T37f17(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T37*)(C))->a6)));
	if (t1) {
		T17f39(R, (T2)('['));
	}
	T17f39(R, (T2)('-'));
	if (((T37*)(C))->a7) {
		T17f39(R, ((T37*)(C))->a8);
		T17f39(R, (T2)(' '));
		T17f41(R, ((T37*)(C))->a4);
	} else {
		T17f39(R, (T2)('-'));
		T17f41(R, ((T37*)(C))->a5);
		T17f39(R, (T2)('='));
		T17f41(R, ((T37*)(C))->a4);
	}
	t1 = ((T1)(!(((T37*)(C))->a6)));
	if (t1) {
		T17f39(R, (T2)(']'));
	}
	return R;
}

/* AP_INTEGER_OPTION.example */
T0* T36f17(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T36*)(C))->a6)));
	if (t1) {
		T17f39(R, (T2)('['));
	}
	T17f39(R, (T2)('-'));
	if (((T36*)(C))->a7) {
		T17f39(R, ((T36*)(C))->a3);
		T17f39(R, (T2)(' '));
		T17f41(R, ((T36*)(C))->a5);
	} else {
		T17f39(R, (T2)('-'));
		T17f41(R, ((T36*)(C))->a2);
		T17f39(R, (T2)('='));
		T17f41(R, ((T36*)(C))->a5);
	}
	t1 = ((T1)(!(((T36*)(C))->a6)));
	if (t1) {
		T17f39(R, (T2)(']'));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.example */
T0* T35f15(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T35*)(C))->a5)));
	if (t1) {
		T17f39(R, (T2)('['));
	}
	T17f39(R, (T2)('-'));
	if (((T35*)(C))->a6) {
		T17f39(R, ((T35*)(C))->a7);
		T17f39(R, (T2)(' '));
		T17f41(R, ((T35*)(C))->a3);
	} else {
		T17f39(R, (T2)('-'));
		T17f41(R, ((T35*)(C))->a4);
		T17f39(R, (T2)('='));
		T17f41(R, ((T35*)(C))->a3);
	}
	t1 = ((T1)(!(((T35*)(C))->a5)));
	if (t1) {
		T17f39(R, (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T33f12(T0* C)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T33*)(C))->a6)));
	if (t1) {
		T17f39(R, (T2)('['));
	}
	T17f39(R, (T2)('-'));
	if (((T33*)(C))->a5) {
		t2 = (T2f1(&(((T33*)(C))->a4)));
		T17f41(R, t2);
	} else {
		T17f39(R, (T2)('-'));
		T17f41(R, ((T33*)(C))->a3);
	}
	t1 = ((T1)(!(((T33*)(C))->a6)));
	if (t1) {
		T17f39(R, (T2)(']'));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T41f32(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T41*)(C))->a3) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(R, ((T41*)(C))->a2);
	}
	t2 = (T41f18(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(R, GE_ms(", ", 2));
		}
		T17f39(R, (T2)('-'));
		T17f39(R, (T2)('-'));
		T17f41(R, ((T41*)(C))->a4);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T37f21(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = (T37f21p1(C));
	t1 = (T37f12(C));
	if (t1) {
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(R, t3);
	} else {
		T17f39(R, (T2)(' '));
	}
	T17f41(R, ((T37*)(C))->a4);
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T37f21p1(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T37*)(C))->a7) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(R, ((T37*)(C))->a8);
	}
	t2 = (T37f12(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(R, GE_ms(", ", 2));
		}
		T17f39(R, (T2)('-'));
		T17f39(R, (T2)('-'));
		T17f41(R, ((T37*)(C))->a5);
	}
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T36f19(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = (T36f19p1(C));
	t1 = (T36f13(C));
	if (t1) {
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(R, t3);
	} else {
		T17f39(R, (T2)(' '));
	}
	T17f41(R, ((T36*)(C))->a5);
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T36f19p1(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T36*)(C))->a7) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(R, ((T36*)(C))->a3);
	}
	t2 = (T36f13(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(R, GE_ms(", ", 2));
		}
		T17f39(R, (T2)('-'));
		T17f39(R, (T2)('-'));
		T17f41(R, ((T36*)(C))->a2);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T35f22(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = (T35f22p1(C));
	t1 = (T35f10(C));
	if (t1) {
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(R, t3);
	} else {
		T17f39(R, (T2)(' '));
	}
	T17f41(R, ((T35*)(C))->a3);
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T35f22p1(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T35*)(C))->a6) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(R, ((T35*)(C))->a7);
	}
	t2 = (T35f10(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(R, GE_ms(", ", 2));
		}
		T17f39(R, (T2)('-'));
		T17f39(R, (T2)('-'));
		T17f41(R, ((T35*)(C))->a4);
	}
	return R;
}

/* AP_FLAG.names */
T0* T33f15(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T33*)(C))->a5) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(R, ((T33*)(C))->a4);
	}
	t2 = (T33f9(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(R, GE_ms(", ", 2));
		}
		T17f39(R, (T2)('-'));
		T17f39(R, (T2)('-'));
		T17f41(R, ((T33*)(C))->a3);
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

/* AP_ENUMERATION_OPTION.has_long_form */
T1 T37f12(T0* C)
{
	T1 R = 0;
	R = ((((T37*)(C))->a5)!=(EIF_VOID));
	return R;
}

/* AP_INTEGER_OPTION.has_long_form */
T1 T36f13(T0* C)
{
	T1 R = 0;
	R = ((((T36*)(C))->a2)!=(EIF_VOID));
	return R;
}

/* AP_BOOLEAN_OPTION.has_long_form */
T1 T35f10(T0* C)
{
	T1 R = 0;
	R = ((((T35*)(C))->a4)!=(EIF_VOID));
	return R;
}

/* AP_FLAG.has_long_form */
T1 T33f9(T0* C)
{
	T1 R = 0;
	R = ((((T33*)(C))->a3)!=(EIF_VOID));
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.last_character */
T2 T940f6(T0* C)
{
	T2 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T1210*)(((T940*)(C))->a3))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T1210f5(((T940*)(C))->a3));
	} else {
		R = (((((T0*)(((T940*)(C))->a4))->id==22)?((T22*)(((T940*)(C))->a4))->a9:((T1387*)(((T940*)(C))->a4))->a2));
	}
	return R;
}

/* DS_LINKED_QUEUE [CHARACTER_8].item */
T2 T1210f5(T0* C)
{
	T2 R = 0;
	R = (((T1313*)(((T1210*)(C))->a2))->a1);
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.end_of_input */
T1 T940f21(T0* C)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T1210*)(((T940*)(C))->a3))->a1);
	t2 = ((t1)==((T6)(GE_int32(0))));
	if (t2) {
		R = (((((T0*)(((T940*)(C))->a4))->id==22)?T22f25(((T940*)(C))->a4):((T1387*)(((T940*)(C))->a4))->a1));
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
T1 T946f16(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_closable */
T1 T940f7(T0* C)
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
T6 T946f11(T0* C, T0* a1, T6 a2, T6 a3)
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
		t1 = ((((T946*)(C))->a4)==(EIF_VOID));
	}
	while (!(t1)) {
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = (GE_void2(((T946*)(C))->a4));
		T17f53(a1, t2, l2);
		((T946*)(C))->a4 = (GE_void0(((T946*)(C))->a4));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T946*)(C))->a4)==(EIF_VOID));
		}
	}
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T946f7(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T946f8(C));
			t1 = (T79f1(t3, a1, ge409ov24738));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T946f10(C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c36(l4);
				T17f48(l5, l4);
				l4 = (T946f10(C, l5, (T6)(GE_int32(1)), l4));
				l3 = (T6)(GE_int32(1));
				t1 = (T6f1(&l3, l4));
				while (!(t1)) {
					t2 = (T17f12(l5, l3));
					T17f53(a1, t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					t1 = (T6f1(&l3, l4));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T946*)(C))->a1 = (T946f7(C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T946f10(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T0* t1;
	T6 t2;
	T14 t3;
	t1 = (((T17*)(a1))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f5(t1, t2));
	R = (T946f13(C, ((T946*)(C))->a5, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T946f13(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T946f8(T0* C)
{
	T0* R = 0;
	if (ge270os1665) {
		return ge270ov1665;
	} else {
		ge270os1665 = '\1';
	}
	R = T79c4();
	ge270ov1665 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T940f28(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	t1 = ((((T940*)(C))->a2)==((T6)(GE_int32(6))));
	if (!(t1)) {
		t1 = ((((T940*)(C))->a2)==((T6)(GE_int32(2))));
	}
	if (!(t1)) {
		t2 = (((T1210*)(((T940*)(C))->a3))->a1);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T940f32(C);
		t1 = (T940f21(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T940f6(C));
			T17f53(a1, t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = ((((T940*)(C))->a2)==((T6)(GE_int32(1))));
		if (t1) {
			R = (((((T0*)(((T940*)(C))->a4))->id==22)?T22f29(((T940*)(C))->a4, a1, a2, a3):T1387f7(((T940*)(C))->a4, a1, a2, a3)));
		} else {
			R = (T940f28p1(C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T940f28p1(T0* C, T0* a1, T6 a2, T6 a3)
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
		T940f32(C);
		t2 = (T940f21(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T940f6(C));
			T17f53(a1, t3, l1);
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
T6 T1387f7(T0* C, T0* a1, T6 a2, T6 a3)
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
		T1387f9(C);
		t2 = ((T1)(!(((T1387*)(C))->a1)));
		if (t2) {
			T17f53(a1, ((T1387*)(C))->a2, l1);
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
		t2 = (((T71*)(((T22*)(C))->a4))->a1);
		T17f53(a1, t2, l1);
		((T22*)(C))->a4 = (((T71*)(((T22*)(C))->a4))->a2);
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
			t1 = (T79f1(t3, a1, ge396ov1685));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T22f28(C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
			} else {
				t3 = (T22f35(C));
				t5 = (T22f37(C));
				t1 = (T79f1(t3, a1, t5));
				if (t1) {
					t4 = ((T6)((a3)-(l5)));
					t4 = (T22f28(C, a1, l1, t4));
					l5 = ((T6)((l5)+(t4)));
				} else {
					l4 = ((T6)((a3)-(l5)));
					l2 = T17c36(l4);
					T17f48(l2, l4);
					l4 = (T22f28(C, l2, (T6)(GE_int32(1)), l4));
					l3 = (T6)(GE_int32(1));
					t1 = (T6f1(&l3, l4));
					while (!(t1)) {
						t2 = (T17f12(l2, l3));
						T17f53(a1, t2, l1);
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
unsigned char ge396os1686 = '\0';
T0* ge396ov1686;
T0* T22f37(T0* C)
{
	T0* R = 0;
	if (ge396os1686) {
		return ge396ov1686;
	} else {
		ge396os1686 = '\1';
	}
	R = T941c10((T6)(GE_int32(0)));
	ge396ov1686 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T22f35(T0* C)
{
	T0* R = 0;
	if (ge270os1665) {
		return ge270ov1665;
	} else {
		ge270os1665 = '\1';
	}
	R = T79c4();
	ge270ov1665 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.name */
T0* T940f5(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(((T940*)(C))->a4))->id==22)?((T22*)(((T940*)(C))->a4))->a2:T1387f6(((T940*)(C))->a4)));
	return R;
}

/* KL_STRING_INPUT_STREAM.name */
unsigned char ge311os1661 = '\0';
T0* ge311ov1661;
T0* T1387f6(T0* C)
{
	T0* R = 0;
	if (ge311os1661) {
		return ge311ov1661;
	} else {
		ge311os1661 = '\1';
	}
	R = GE_ms("STRING", 6);
	ge311ov1661 = R;
	return R;
}

T0* GE_ma892(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T891)+c*sizeof(T0*));
	((T0*)(t1))->id = 891;
	((T891*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T891*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T892));
	((T0*)(R))->id = 892;
	((T892*)(R))->a1 = t1;
	((T892*)(R))->a2 = 1;
	((T892*)(R))->a3 = (T6)c;
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

T0* GE_ma312(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T116)+c*sizeof(T6));
	((T0*)(t1))->id = 116;
	((T116*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T6 *i = ((T116*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T312));
	((T0*)(R))->id = 312;
	((T312*)(R))->a1 = t1;
	((T312*)(R))->a2 = 1;
	((T312*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma950(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T629)+c*sizeof(T0*));
	((T0*)(t1))->id = 629;
	((T629*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T629*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T950));
	((T0*)(R))->id = 950;
	((T950*)(R))->a1 = t1;
	((T950*)(R))->a2 = 1;
	((T950*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma336(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T335)+c*sizeof(T0*));
	((T0*)(t1))->id = 335;
	((T335*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T335*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T336));
	((T0*)(R))->id = 336;
	((T336*)(R))->a1 = t1;
	((T336*)(R))->a2 = 1;
	((T336*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_mt237()
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(T237));
	((T0*)(R))->id = 237;
	return R;
}

void GE_void(T0* C, ...)
{
	printf("Call on Void target!\n");
	exit(1);
}

T0* GE_void0(T0* C, ...)
{
	GE_void(C);
	return 0;
}

T1 GE_void1(T0* C, ...)
{
	GE_void(C);
	return 0;
}

T6 GE_void6(T0* C, ...)
{
	GE_void(C);
	return 0;
}

T2 GE_void2(T0* C, ...)
{
	GE_void(C);
	return 0;
}

T0* ge408ov9076;
T0* ge412ov2776;
T0* ge351ov24652;
T0* ge418ov9645;
T0* ge385ov1705;
T0* ge1150ov16436;
T0* ge1150ov16421;
T0* ge1150ov16414;
T0* ge1150ov16399;
T0* ge1150ov16424;
T0* ge1150ov16417;
T0* ge1150ov16425;
T0* ge1150ov16434;
T0* ge1150ov16427;
T0* ge1150ov16423;
T0* ge1150ov16411;
T0* ge1150ov16412;
T0* ge1150ov16426;
T0* ge1150ov16413;
T0* ge1150ov16400;
T0* ge1150ov16401;
T0* ge1150ov16402;
T0* ge1150ov16408;
T0* ge1150ov16410;
T0* ge1150ov16405;
T0* ge1150ov16430;
T0* ge1150ov16429;
T0* ge1150ov16406;
T0* ge1150ov16407;
T0* ge1150ov16404;
T0* ge1150ov16403;
T0* ge1146ov16194;
T0* ge951ov7009;
T0* ge774ov13498;
T0* ge774ov13472;
T0* ge774ov13410;
T0* ge774ov13560;
T0* ge951ov7018;
T0* ge951ov6978;
T0* ge951ov6934;
T0* ge946ov23606;
T0* ge946ov23605;
T0* ge946ov23604;
T0* ge774ov13534;
T0* ge951ov6972;
T0* ge951ov6968;
T0* ge951ov7004;
T0* ge951ov6947;
T0* ge951ov6967;
T0* ge951ov7025;
T0* ge951ov6980;
T0* ge951ov6983;
T0* ge951ov7005;
T0* ge951ov6982;
T0* ge951ov6981;
T0* ge951ov7021;
T0* ge951ov6936;
T0* ge951ov7010;
T0* ge951ov7008;
T0* ge951ov6971;
T0* ge951ov7007;
T0* ge951ov6975;
T0* ge951ov7019;
T0* ge951ov7017;
T0* ge951ov6974;
T0* ge774ov13537;
T0* ge951ov6992;
T0* ge951ov6990;
T0* ge951ov7023;
T0* ge951ov7020;
T0* ge951ov6935;
T0* ge951ov7022;
T0* ge951ov6991;
T0* ge951ov6999;
T0* ge951ov6940;
T0* ge951ov6984;
T0* ge951ov6979;
T0* ge951ov6937;
T0* ge951ov6970;
T0* ge951ov6963;
T0* ge951ov6962;
T0* ge951ov6955;
T0* ge951ov6954;
T0* ge951ov6953;
T0* ge951ov6948;
T0* ge951ov6943;
T0* ge951ov6942;
T0* ge951ov6997;
T0* ge951ov6985;
T0* ge951ov6976;
T0* ge951ov7016;
T0* ge951ov6998;
T0* ge951ov6969;
T0* ge951ov6939;
T0* ge951ov6941;
T0* ge951ov7015;
T0* ge951ov6965;
T0* ge951ov6964;
T0* ge951ov6956;
T0* ge951ov6960;
T0* ge951ov6959;
T0* ge951ov6958;
T0* ge951ov6957;
T0* ge951ov6952;
T0* ge951ov6951;
T0* ge951ov6950;
T0* ge951ov6949;
T0* ge951ov6945;
T0* ge951ov6944;
T0* ge951ov6946;
T0* ge774ov13418;
T0* ge774ov13438;
T0* ge774ov13428;
T0* ge774ov13422;
T0* ge774ov13451;
T0* ge774ov13415;
T0* ge774ov13556;
T0* ge410ov9076;
T0* ge949ov23594;
T0* ge949ov23588;
T0* ge949ov23582;
T0* ge949ov23590;
T0* ge949ov23584;
T0* ge949ov23578;
T0* ge949ov23593;
T0* ge949ov23587;
T0* ge949ov23581;
T0* ge949ov23595;
T0* ge949ov23589;
T0* ge949ov23583;
T0* ge774ov13481;
T0* ge949ov23592;
T0* ge949ov23586;
T0* ge949ov23580;
T0* ge774ov13523;
T0* ge774ov13506;
T0* ge774ov13532;
T0* ge774ov13500;
T0* ge774ov13479;
T0* ge950ov24468;
T0* ge950ov24226;
T0* ge950ov24090;
T0* ge950ov24466;
T0* ge950ov24224;
T0* ge950ov24088;
T0* ge950ov24467;
T0* ge950ov24225;
T0* ge950ov24089;
T0* ge774ov13454;
T0* ge949ov23591;
T0* ge949ov23585;
T0* ge949ov23579;
T0* ge942ov25748;
T0* ge942ov25746;
T0* ge942ov25744;
T0* ge1074ov4872;
T0* ge941ov24521;
T0* ge941ov24517;
T0* ge941ov24513;
T0* ge997ov18624;
T0* ge386ov8890;
T0* ge584ov11642;
T0* ge584ov11643;
T0* ge941ov24522;
T0* ge941ov24518;
T0* ge941ov24514;
T0* ge948ov24530;
T0* ge948ov24529;
T0* ge950ov24423;
T0* ge950ov24197;
T0* ge950ov24045;
T0* ge950ov24425;
T0* ge950ov24047;
T0* ge950ov24418;
T0* ge950ov24040;
T0* ge950ov24421;
T0* ge950ov24043;
T0* ge950ov24417;
T0* ge950ov24039;
T0* ge950ov24416;
T0* ge950ov24038;
T0* ge774ov13550;
T0* ge774ov13452;
T0* ge774ov13643;
T0* ge774ov13644;
T0* ge774ov13645;
T0* ge774ov13646;
T0* ge774ov13647;
T0* ge774ov13648;
T0* ge774ov13649;
T0* ge774ov13650;
T0* ge774ov13651;
T0* ge774ov13652;
T0* ge774ov13653;
T0* ge774ov13654;
T0* ge774ov13655;
T0* ge774ov13656;
T0* ge774ov13657;
T0* ge774ov13658;
T0* ge774ov13659;
T0* ge774ov13660;
T0* ge774ov13661;
T0* ge774ov13662;
T0* ge774ov13663;
T0* ge774ov13664;
T0* ge774ov13665;
T0* ge774ov13666;
T0* ge774ov13708;
T0* ge774ov13709;
T0* ge774ov13710;
T0* ge774ov13411;
T0* ge774ov13412;
T0* ge774ov13413;
T0* ge774ov13414;
T0* ge774ov13416;
T0* ge774ov13417;
T0* ge774ov13419;
T0* ge774ov13420;
T0* ge774ov13421;
T0* ge774ov13423;
T0* ge774ov13424;
T0* ge774ov13425;
T0* ge774ov13426;
T0* ge774ov13427;
T0* ge774ov13429;
T0* ge774ov13430;
T0* ge774ov13431;
T0* ge774ov13432;
T0* ge774ov13433;
T0* ge774ov13434;
T0* ge774ov13435;
T0* ge774ov13436;
T0* ge774ov13437;
T0* ge774ov13439;
T0* ge774ov13440;
T0* ge774ov13441;
T0* ge774ov13442;
T0* ge774ov13443;
T0* ge774ov13444;
T0* ge774ov13445;
T0* ge774ov13446;
T0* ge774ov13447;
T0* ge774ov13448;
T0* ge774ov13449;
T0* ge774ov13450;
T0* ge774ov13453;
T0* ge774ov13455;
T0* ge774ov13456;
T0* ge774ov13461;
T0* ge774ov13462;
T0* ge774ov13463;
T0* ge774ov13464;
T0* ge774ov13457;
T0* ge774ov13458;
T0* ge774ov13459;
T0* ge774ov13460;
T0* ge774ov13465;
T0* ge774ov13466;
T0* ge774ov13467;
T0* ge774ov13468;
T0* ge774ov13469;
T0* ge774ov13470;
T0* ge774ov13471;
T0* ge774ov13473;
T0* ge774ov13474;
T0* ge774ov13475;
T0* ge774ov13476;
T0* ge774ov13477;
T0* ge774ov13478;
T0* ge774ov13480;
T0* ge774ov13482;
T0* ge774ov13483;
T0* ge774ov13484;
T0* ge774ov13485;
T0* ge774ov13486;
T0* ge774ov13487;
T0* ge774ov13488;
T0* ge774ov13489;
T0* ge774ov13490;
T0* ge774ov13491;
T0* ge774ov13492;
T0* ge774ov13493;
T0* ge774ov13494;
T0* ge774ov13495;
T0* ge774ov13496;
T0* ge774ov13497;
T0* ge774ov13499;
T0* ge774ov13501;
T0* ge774ov13502;
T0* ge774ov13503;
T0* ge774ov13504;
T0* ge774ov13505;
T0* ge774ov13507;
T0* ge774ov13508;
T0* ge774ov13509;
T0* ge774ov13510;
T0* ge774ov13511;
T0* ge774ov13512;
T0* ge774ov13513;
T0* ge774ov13514;
T0* ge774ov13515;
T0* ge774ov13516;
T0* ge774ov13517;
T0* ge774ov13518;
T0* ge774ov13519;
T0* ge774ov13520;
T0* ge774ov13521;
T0* ge774ov13522;
T0* ge774ov13524;
T0* ge774ov13525;
T0* ge774ov13526;
T0* ge774ov13527;
T0* ge774ov13528;
T0* ge774ov13529;
T0* ge774ov13530;
T0* ge774ov13531;
T0* ge774ov13533;
T0* ge774ov13535;
T0* ge774ov13536;
T0* ge774ov13538;
T0* ge774ov13539;
T0* ge774ov13540;
T0* ge774ov13541;
T0* ge774ov13542;
T0* ge774ov13543;
T0* ge774ov13544;
T0* ge774ov13546;
T0* ge774ov13547;
T0* ge774ov13548;
T0* ge774ov13549;
T0* ge774ov13551;
T0* ge774ov13552;
T0* ge774ov13553;
T0* ge774ov13554;
T0* ge774ov13555;
T0* ge774ov13557;
T0* ge774ov13558;
T0* ge774ov13559;
T0* ge774ov13561;
T0* ge774ov13562;
T0* ge774ov13563;
T0* ge774ov13564;
T0* ge774ov13565;
T0* ge774ov13566;
T0* ge774ov13567;
T0* ge774ov13568;
T0* ge774ov13569;
T0* ge774ov13570;
T0* ge774ov13571;
T0* ge774ov13572;
T0* ge774ov13573;
T0* ge774ov13574;
T0* ge774ov13575;
T0* ge774ov13576;
T0* ge774ov13577;
T0* ge774ov13578;
T0* ge774ov13579;
T0* ge774ov13580;
T0* ge774ov13581;
T0* ge774ov13582;
T0* ge774ov13583;
T0* ge774ov13584;
T0* ge774ov13586;
T0* ge774ov13587;
T0* ge774ov13588;
T0* ge774ov13589;
T0* ge774ov13590;
T0* ge774ov13591;
T0* ge774ov13592;
T0* ge774ov13593;
T0* ge774ov13594;
T0* ge774ov13595;
T0* ge774ov13596;
T0* ge774ov13597;
T0* ge774ov13598;
T0* ge774ov13599;
T0* ge774ov13600;
T0* ge774ov13601;
T0* ge774ov13602;
T0* ge774ov13603;
T0* ge774ov13604;
T0* ge774ov13605;
T0* ge774ov13606;
T0* ge774ov13607;
T0* ge774ov13608;
T0* ge774ov13609;
T0* ge774ov13610;
T0* ge774ov13611;
T0* ge774ov13612;
T0* ge774ov13613;
T0* ge774ov13614;
T0* ge774ov13615;
T0* ge774ov13616;
T0* ge774ov13617;
T0* ge774ov13618;
T0* ge774ov13619;
T0* ge774ov13620;
T0* ge774ov13621;
T0* ge774ov13622;
T0* ge774ov13623;
T0* ge774ov13624;
T0* ge774ov13625;
T0* ge774ov13626;
T0* ge774ov13627;
T0* ge774ov13628;
T0* ge774ov13629;
T0* ge774ov13630;
T0* ge774ov13631;
T0* ge774ov13632;
T0* ge774ov13633;
T0* ge774ov13634;
T0* ge774ov13635;
T0* ge774ov13636;
T0* ge774ov13637;
T0* ge774ov13638;
T0* ge774ov13639;
T0* ge774ov13640;
T0* ge774ov13641;
T0* ge287ov11568;
T0* ge383ov20349;
T0* ge383ov20346;
T0* ge962ov15199;
T0* ge381ov20213;
T0* ge950ov24434;
T0* ge950ov24200;
T0* ge950ov24056;
T0* ge950ov24433;
T0* ge950ov24055;
T0* ge950ov24465;
T0* ge950ov24223;
T0* ge950ov24087;
T0* ge950ov24464;
T0* ge950ov24222;
T0* ge950ov24086;
T0* ge774ov13585;
T0* ge774ov13545;
T0* ge950ov24470;
T0* ge950ov24228;
T0* ge950ov24092;
T0* ge950ov24469;
T0* ge950ov24227;
T0* ge950ov24091;
T0* ge1264ov10284;
T0* ge1264ov10283;
T0* ge1007ov4168;
T0* ge1007ov4169;
T0* ge1007ov4170;
T0* ge1007ov4171;
T0* ge1007ov4172;
T0* ge1007ov4173;
T0* ge1007ov4174;
T0* ge1007ov4175;
T0* ge1007ov4176;
T0* ge1007ov4177;
T0* ge1007ov4178;
T0* ge1007ov4179;
T0* ge1007ov4180;
T0* ge1007ov4181;
T0* ge1007ov4182;
T0* ge1007ov4183;
T0* ge1007ov4184;
T0* ge1007ov4185;
T0* ge1007ov4186;
T0* ge1007ov4187;
T0* ge1007ov4188;
T0* ge1007ov4189;
T0* ge1007ov4190;
T0* ge1007ov4191;
T0* ge1007ov4192;
T0* ge1007ov4193;
T0* ge1007ov4194;
T0* ge1007ov4195;
T0* ge1007ov4196;
T0* ge1007ov4197;
T0* ge1007ov4198;
T0* ge1007ov4199;
T0* ge1007ov4200;
T0* ge1007ov4201;
T0* ge1007ov4202;
T0* ge1007ov4203;
T0* ge1007ov4204;
T0* ge1007ov4205;
T0* ge1007ov4206;
T0* ge1007ov4207;
T0* ge1007ov4208;
T0* ge1007ov4209;
T0* ge1007ov4210;
T0* ge1007ov4211;
T0* ge1007ov4212;
T0* ge1007ov4213;
T0* ge1007ov4214;
T0* ge1007ov4215;
T0* ge1007ov4216;
T0* ge1007ov4217;
T0* ge1007ov4218;
T0* ge1007ov4219;
T0* ge1007ov4220;
T0* ge1007ov4221;
T0* ge1007ov4222;
T0* ge1007ov4223;
T0* ge1007ov4224;
T0* ge1007ov4225;
T0* ge1007ov4226;
T0* ge1007ov4227;
T0* ge1007ov4228;
T0* ge1007ov4229;
T0* ge1007ov4230;
T0* ge1007ov4231;
T0* ge1007ov4232;
T0* ge1007ov4233;
T0* ge1007ov4234;
T0* ge1007ov4235;
T0* ge1007ov4236;
T0* ge1007ov4237;
T0* ge1007ov4238;
T0* ge1007ov4239;
T0* ge1007ov4240;
T0* ge1007ov4241;
T0* ge1007ov4242;
T0* ge1007ov4243;
T0* ge1007ov4244;
T0* ge1007ov4245;
T0* ge1007ov4246;
T0* ge1007ov4247;
T0* ge1007ov4248;
T0* ge1040ov4135;
T0* ge1007ov4354;
T0* ge1007ov4341;
T0* ge1007ov4346;
T0* ge1007ov4347;
T0* ge1007ov4348;
T0* ge1007ov4335;
T0* ge1007ov4352;
T0* ge1007ov4356;
T0* ge1007ov4339;
T0* ge1007ov4331;
T0* ge1007ov4342;
T0* ge1007ov4340;
T0* ge1007ov4337;
T0* ge1007ov4351;
T0* ge1007ov4350;
T0* ge1007ov4333;
T0* ge1007ov4355;
T0* ge1007ov4332;
T0* ge1007ov4338;
T0* ge1007ov4353;
T0* ge1007ov4345;
T0* ge1007ov4334;
T0* ge1007ov4349;
T0* ge1007ov4343;
T0* ge1007ov4336;
T0* ge1007ov4358;
T0* ge1007ov4344;
T0* ge1040ov4134;
T0* ge1040ov4133;
T0* ge1003ov17752;
T0* ge1271ov10821;
T0* ge1271ov10783;
T0* ge1271ov10781;
T0* ge1271ov10822;
T0* ge1271ov10794;
T0* ge1271ov10793;
T0* ge1271ov10804;
T0* ge1271ov10798;
T0* ge1271ov10797;
T0* ge1271ov10796;
T0* ge1271ov10802;
T0* ge1271ov10801;
T0* ge1271ov10803;
T0* ge1271ov10780;
T0* ge1271ov10806;
T0* ge1271ov10815;
T0* ge1274ov10636;
T0* ge1274ov10634;
T0* ge1274ov10635;
T0* ge1271ov10816;
T0* ge1271ov10817;
T0* ge1271ov10820;
T0* ge1271ov10818;
T0* ge1271ov10819;
T0* ge1271ov10813;
T0* ge1267ov19879;
T0* ge1267ov19880;
T0* ge1271ov10786;
T0* ge1271ov10809;
T0* ge1271ov10829;
T0* ge1271ov10830;
T0* ge1271ov10831;
T0* ge1271ov10824;
T0* ge1271ov10807;
T0* ge1271ov10808;
T0* ge1271ov10810;
T0* ge1271ov10814;
T0* ge62ov3836;
T0* ge62ov3842;
T0* ge60ov4070;
T0* ge321ov1579;
T0* ge59ov3324;
T0* ge62ov3837;
T0* ge62ov3843;
T0* ge62ov3838;
T0* ge62ov3844;
T0* ge62ov3839;
T0* ge62ov3845;
T0* ge62ov3840;
T0* ge62ov3846;
T0* ge59ov3319;
T0* ge59ov3318;
T0* ge59ov3326;
T0* ge59ov3325;
T0* ge1278ov19589;
T0* ge1278ov19590;
T0* ge1269ov24660;
T0* ge1269ov24662;
T0* ge950ov24448;
T0* ge950ov24208;
T0* ge950ov24070;
T0* ge950ov24447;
T0* ge950ov24069;
T0* ge950ov24271;
T0* ge950ov24120;
T0* ge950ov23893;
T0* ge950ov24445;
T0* ge950ov24207;
T0* ge950ov24067;
T0* ge950ov24444;
T0* ge950ov24066;
T0* ge950ov24270;
T0* ge950ov24119;
T0* ge950ov23892;
T0* ge950ov24238;
T0* ge950ov24105;
T0* ge950ov23860;
T0* ge950ov24237;
T0* ge950ov23859;
T0* ge950ov24450;
T0* ge950ov24210;
T0* ge950ov24072;
T0* ge950ov24475;
T0* ge950ov24231;
T0* ge950ov24097;
T0* ge950ov24476;
T0* ge950ov24098;
T0* ge950ov24473;
T0* ge950ov24230;
T0* ge950ov24095;
T0* ge950ov24474;
T0* ge950ov24096;
T0* ge950ov24366;
T0* ge950ov24165;
T0* ge950ov23988;
T0* ge950ov24479;
T0* ge950ov24233;
T0* ge950ov24101;
T0* ge950ov24480;
T0* ge950ov24102;
T0* ge950ov24477;
T0* ge950ov24232;
T0* ge950ov24099;
T0* ge950ov24478;
T0* ge950ov24100;
T0* ge950ov24364;
T0* ge950ov24164;
T0* ge950ov23986;
T0* ge950ov24302;
T0* ge950ov24136;
T0* ge950ov23924;
T0* ge950ov24304;
T0* ge950ov23926;
T0* ge950ov24300;
T0* ge950ov23922;
T0* ge950ov24306;
T0* ge950ov23928;
T0* ge950ov24303;
T0* ge950ov23925;
T0* ge950ov24301;
T0* ge950ov23923;
T0* ge950ov24346;
T0* ge950ov24147;
T0* ge950ov23968;
T0* ge950ov24256;
T0* ge950ov24113;
T0* ge950ov23878;
T0* ge950ov24254;
T0* ge950ov23876;
T0* ge950ov24248;
T0* ge950ov24112;
T0* ge950ov23870;
T0* ge950ov24247;
T0* ge950ov24111;
T0* ge950ov23869;
T0* ge950ov24459;
T0* ge950ov24217;
T0* ge950ov24081;
T0* ge950ov24463;
T0* ge950ov24221;
T0* ge950ov24085;
T0* ge950ov24438;
T0* ge950ov24203;
T0* ge950ov24060;
T0* ge950ov24462;
T0* ge950ov24220;
T0* ge950ov24084;
T0* ge950ov24345;
T0* ge950ov24155;
T0* ge950ov23967;
T0* ge950ov24347;
T0* ge950ov23969;
T0* ge950ov24453;
T0* ge950ov24212;
T0* ge950ov24075;
T0* ge950ov24440;
T0* ge950ov24204;
T0* ge950ov24062;
T0* ge950ov24441;
T0* ge950ov24063;
T0* ge950ov24344;
T0* ge950ov24154;
T0* ge950ov23966;
T0* ge950ov24340;
T0* ge950ov24153;
T0* ge950ov23962;
T0* ge950ov24341;
T0* ge950ov23963;
T0* ge950ov24332;
T0* ge950ov24150;
T0* ge950ov23954;
T0* ge950ov24343;
T0* ge950ov23965;
T0* ge950ov24342;
T0* ge950ov23964;
T0* ge950ov24339;
T0* ge950ov24152;
T0* ge950ov23961;
T0* ge950ov24311;
T0* ge950ov24140;
T0* ge950ov23933;
T0* ge950ov24310;
T0* ge950ov24139;
T0* ge950ov23932;
T0* ge950ov24309;
T0* ge950ov24138;
T0* ge950ov23931;
T0* ge950ov24308;
T0* ge950ov24137;
T0* ge950ov23930;
T0* ge950ov24307;
T0* ge950ov23929;
T0* ge950ov24246;
T0* ge950ov24110;
T0* ge950ov23868;
T0* ge950ov24244;
T0* ge950ov24109;
T0* ge950ov23866;
T0* ge950ov24274;
T0* ge950ov24121;
T0* ge950ov23896;
T0* ge950ov24275;
T0* ge950ov23897;
T0* ge950ov24258;
T0* ge950ov24114;
T0* ge950ov23880;
T0* ge950ov24257;
T0* ge950ov23879;
T0* ge950ov24259;
T0* ge950ov23881;
T0* ge950ov24283;
T0* ge950ov24125;
T0* ge950ov23905;
T0* ge950ov24272;
T0* ge950ov23894;
T0* ge950ov24273;
T0* ge950ov23895;
T0* ge950ov24317;
T0* ge950ov24141;
T0* ge950ov23939;
T0* ge950ov24314;
T0* ge950ov23936;
T0* ge950ov24321;
T0* ge950ov24142;
T0* ge950ov23943;
T0* ge950ov24318;
T0* ge950ov23940;
T0* ge950ov24315;
T0* ge950ov23937;
T0* ge950ov24322;
T0* ge950ov23944;
T0* ge950ov24319;
T0* ge950ov23941;
T0* ge950ov24316;
T0* ge950ov23938;
T0* ge950ov24323;
T0* ge950ov23945;
T0* ge950ov24430;
T0* ge950ov24199;
T0* ge950ov24052;
T0* ge950ov24328;
T0* ge950ov24146;
T0* ge950ov23950;
T0* ge950ov24327;
T0* ge950ov23949;
T0* ge950ov24313;
T0* ge950ov23935;
T0* ge950ov24312;
T0* ge950ov23934;
T0* ge950ov24320;
T0* ge950ov23942;
T0* ge950ov24326;
T0* ge950ov24145;
T0* ge950ov23948;
T0* ge950ov24325;
T0* ge950ov24144;
T0* ge950ov23947;
T0* ge950ov24324;
T0* ge950ov24143;
T0* ge950ov23946;
T0* ge950ov24408;
T0* ge950ov24192;
T0* ge950ov24030;
T0* ge950ov24406;
T0* ge950ov24191;
T0* ge950ov24028;
T0* ge950ov24261;
T0* ge950ov24115;
T0* ge950ov23883;
T0* ge950ov24374;
T0* ge950ov24170;
T0* ge950ov23996;
T0* ge950ov24260;
T0* ge950ov23882;
T0* ge950ov24373;
T0* ge950ov23995;
T0* ge950ov24372;
T0* ge950ov24169;
T0* ge950ov23994;
T0* ge950ov24291;
T0* ge950ov24130;
T0* ge950ov23913;
T0* ge950ov24289;
T0* ge950ov24128;
T0* ge950ov23911;
T0* ge950ov24288;
T0* ge950ov23910;
T0* ge950ov24295;
T0* ge950ov24132;
T0* ge950ov23917;
T0* ge950ov24294;
T0* ge950ov23916;
T0* ge950ov24296;
T0* ge950ov24133;
T0* ge950ov23918;
T0* ge950ov24356;
T0* ge950ov24159;
T0* ge950ov23978;
T0* ge950ov24355;
T0* ge950ov23977;
T0* ge950ov24354;
T0* ge950ov23976;
T0* ge950ov24353;
T0* ge950ov23975;
T0* ge950ov24357;
T0* ge950ov24160;
T0* ge950ov23979;
T0* ge950ov24277;
T0* ge950ov24122;
T0* ge950ov23899;
T0* ge950ov24276;
T0* ge950ov23898;
T0* ge950ov24282;
T0* ge950ov23904;
T0* ge950ov24279;
T0* ge950ov24123;
T0* ge950ov23901;
T0* ge950ov24280;
T0* ge950ov23902;
T0* ge950ov24371;
T0* ge950ov23993;
T0* ge950ov24278;
T0* ge950ov23900;
T0* ge950ov24292;
T0* ge950ov23914;
T0* ge950ov24281;
T0* ge950ov24124;
T0* ge950ov23903;
T0* ge950ov24286;
T0* ge950ov24126;
T0* ge950ov23908;
T0* ge950ov24284;
T0* ge950ov23906;
T0* ge950ov24285;
T0* ge950ov23907;
T0* ge950ov24379;
T0* ge950ov24174;
T0* ge950ov24001;
T0* ge950ov24375;
T0* ge950ov24171;
T0* ge950ov23997;
T0* ge950ov24377;
T0* ge950ov24172;
T0* ge950ov23999;
T0* ge950ov24287;
T0* ge950ov24127;
T0* ge950ov23909;
T0* ge950ov24293;
T0* ge950ov24131;
T0* ge950ov23915;
T0* ge950ov24368;
T0* ge950ov24167;
T0* ge950ov23990;
T0* ge950ov24351;
T0* ge950ov24157;
T0* ge950ov23973;
T0* ge950ov24378;
T0* ge950ov24173;
T0* ge950ov24000;
T0* ge950ov24290;
T0* ge950ov24129;
T0* ge950ov23912;
T0* ge950ov24297;
T0* ge950ov24134;
T0* ge950ov23919;
T0* ge950ov24369;
T0* ge950ov24168;
T0* ge950ov23991;
T0* ge950ov24367;
T0* ge950ov24166;
T0* ge950ov23989;
T0* ge950ov24352;
T0* ge950ov24158;
T0* ge950ov23974;
T0* ge950ov24370;
T0* ge950ov23992;
T0* ge950ov24436;
T0* ge950ov24202;
T0* ge950ov24058;
T0* ge950ov24437;
T0* ge950ov24059;
T0* ge951ov6977;
T0* ge951ov6938;
T0* ge950ov24240;
T0* ge950ov23862;
T0* ge950ov24239;
T0* ge950ov23861;
T0* ge950ov24452;
T0* ge950ov24211;
T0* ge950ov24074;
T0* ge950ov24446;
T0* ge950ov24068;
T0* ge950ov24451;
T0* ge950ov24073;
T0* ge950ov24365;
T0* ge950ov23987;
T0* ge950ov24400;
T0* ge950ov24188;
T0* ge950ov24022;
T0* ge950ov24399;
T0* ge950ov24187;
T0* ge950ov24021;
T0* ge950ov24398;
T0* ge950ov24186;
T0* ge950ov24020;
T0* ge950ov24397;
T0* ge950ov24185;
T0* ge950ov24019;
T0* ge950ov24396;
T0* ge950ov24184;
T0* ge950ov24018;
T0* ge950ov24395;
T0* ge950ov24183;
T0* ge950ov24017;
T0* ge950ov24401;
T0* ge950ov24189;
T0* ge950ov24023;
T0* ge950ov24410;
T0* ge950ov24193;
T0* ge950ov24032;
T0* ge950ov24411;
T0* ge950ov24194;
T0* ge950ov24033;
T0* ge950ov24407;
T0* ge950ov24029;
T0* ge951ov7024;
T0* ge951ov7001;
T0* ge951ov7003;
T0* ge951ov7000;
T0* ge951ov7002;
T0* ge951ov6986;
T0* ge951ov6987;
T0* ge951ov6988;
T0* ge951ov6989;
T0* ge951ov6993;
T0* ge951ov6994;
T0* ge951ov6995;
T0* ge951ov6996;
T0* ge950ov24334;
T0* ge950ov23956;
T0* ge950ov24337;
T0* ge950ov24151;
T0* ge950ov23959;
T0* ge950ov24330;
T0* ge950ov24149;
T0* ge950ov23952;
T0* ge950ov24333;
T0* ge950ov23955;
T0* ge950ov24268;
T0* ge950ov24118;
T0* ge950ov23890;
T0* ge950ov24263;
T0* ge950ov24116;
T0* ge950ov23885;
T0* ge950ov24266;
T0* ge950ov23888;
T0* ge950ov24265;
T0* ge950ov23887;
T0* ge950ov24264;
T0* ge950ov24117;
T0* ge950ov23886;
T0* ge950ov24449;
T0* ge950ov24209;
T0* ge950ov24071;
T0* ge950ov24454;
T0* ge950ov24213;
T0* ge950ov24076;
T0* ge774ov13642;
T0* ge950ov24236;
T0* ge950ov24104;
T0* ge950ov23858;
T0* ge950ov24383;
T0* ge950ov24177;
T0* ge950ov24005;
T0* ge950ov24390;
T0* ge950ov24181;
T0* ge950ov24012;
T0* ge950ov24389;
T0* ge950ov24011;
T0* ge950ov24388;
T0* ge950ov24180;
T0* ge950ov24010;
T0* ge950ov24387;
T0* ge950ov24009;
T0* ge950ov24386;
T0* ge950ov24179;
T0* ge950ov24008;
T0* ge950ov24385;
T0* ge950ov24007;
T0* ge950ov24384;
T0* ge950ov24178;
T0* ge950ov24006;
T0* ge950ov24382;
T0* ge950ov24004;
T0* ge950ov24457;
T0* ge950ov24215;
T0* ge950ov24079;
T0* ge950ov24455;
T0* ge950ov24214;
T0* ge950ov24077;
T0* ge950ov24394;
T0* ge950ov24182;
T0* ge950ov24016;
T0* ge950ov24393;
T0* ge950ov24015;
T0* ge950ov24413;
T0* ge950ov24195;
T0* ge950ov24035;
T0* ge950ov24415;
T0* ge950ov24196;
T0* ge950ov24037;
T0* ge950ov24405;
T0* ge950ov24190;
T0* ge950ov24027;
T0* ge950ov24392;
T0* ge950ov24014;
T0* ge950ov24391;
T0* ge950ov24013;
T0* ge950ov24409;
T0* ge950ov24031;
T0* ge950ov24404;
T0* ge950ov24026;
T0* ge950ov24471;
T0* ge950ov24229;
T0* ge950ov24093;
T0* ge950ov24472;
T0* ge950ov24094;
T0* ge950ov24443;
T0* ge950ov24206;
T0* ge950ov24065;
T0* ge950ov24442;
T0* ge950ov24205;
T0* ge950ov24064;
T0* ge950ov24435;
T0* ge950ov24201;
T0* ge950ov24057;
T0* ge950ov24461;
T0* ge950ov24219;
T0* ge950ov24083;
T0* ge950ov24250;
T0* ge950ov23872;
T0* ge950ov24349;
T0* ge950ov24156;
T0* ge950ov23971;
T0* ge950ov24460;
T0* ge950ov24218;
T0* ge950ov24082;
T0* ge950ov24249;
T0* ge950ov23871;
T0* ge950ov24348;
T0* ge950ov23970;
T0* ge950ov24432;
T0* ge950ov24054;
T0* ge950ov24431;
T0* ge950ov24053;
T0* ge950ov24251;
T0* ge950ov23873;
T0* ge950ov24350;
T0* ge950ov23972;
T0* ge950ov24428;
T0* ge950ov24198;
T0* ge950ov24050;
T0* ge950ov24429;
T0* ge950ov24051;
T0* ge950ov24243;
T0* ge950ov24108;
T0* ge950ov23865;
T0* ge950ov24242;
T0* ge950ov24107;
T0* ge950ov23864;
T0* ge950ov24358;
T0* ge950ov24161;
T0* ge950ov23980;
T0* ge950ov24298;
T0* ge950ov24135;
T0* ge950ov23920;
T0* ge950ov24299;
T0* ge950ov23921;
T0* ge950ov24360;
T0* ge950ov24162;
T0* ge950ov23982;
T0* ge950ov24361;
T0* ge950ov23983;
T0* ge950ov24359;
T0* ge950ov23981;
T0* ge950ov24362;
T0* ge950ov24163;
T0* ge950ov23984;
T0* ge950ov24381;
T0* ge950ov24176;
T0* ge950ov24003;
T0* ge950ov24380;
T0* ge950ov24175;
T0* ge950ov24002;
T0* ge950ov24241;
T0* ge950ov24106;
T0* ge950ov23863;
T0* ge951ov7026;
T0* ge950ov24336;
T0* ge950ov23958;
T0* ge950ov24338;
T0* ge950ov23960;
T0* ge950ov24331;
T0* ge950ov23953;
T0* ge950ov24329;
T0* ge950ov24148;
T0* ge950ov23951;
T0* ge950ov24335;
T0* ge950ov23957;
T0* ge950ov24262;
T0* ge950ov23884;
T0* ge950ov24363;
T0* ge950ov23985;
T0* ge950ov24439;
T0* ge950ov24061;
T0* ge950ov24255;
T0* ge950ov23877;
T0* ge950ov24253;
T0* ge950ov23875;
T0* ge950ov24252;
T0* ge950ov23874;
T0* ge950ov24458;
T0* ge950ov24216;
T0* ge950ov24080;
T0* ge951ov7006;
T0* ge860ov19051;
T0* ge853ov22800;
T0* ge856ov21865;
T0* ge832ov21897;
T0* ge1221ov9994;
T0* ge1202ov19445;
T0* ge1202ov19444;
T0* ge415ov9076;
T0* ge312ov9076;
T0* ge303ov9076;
T0* ge60ov4071;
T0* ge60ov4072;
T0* ge60ov4073;
T0* ge778ov22522;
T0* ge774ov13707;
T0* ge774ov13688;
T0* ge774ov13704;
T0* ge774ov13692;
T0* ge774ov13693;
T0* ge774ov13694;
T0* ge774ov13695;
T0* ge774ov13689;
T0* ge774ov13696;
T0* ge774ov13697;
T0* ge774ov13698;
T0* ge774ov13699;
T0* ge774ov13690;
T0* ge774ov13705;
T0* ge774ov13700;
T0* ge774ov13701;
T0* ge774ov13702;
T0* ge774ov13691;
T0* ge774ov13703;
T0* ge774ov13706;
T0* ge1269ov24659;
T0* ge1269ov24661;
T0* ge774ov13684;
T0* ge774ov13683;
T0* ge774ov13671;
T0* ge774ov13672;
T0* ge774ov13673;
T0* ge774ov13674;
T0* ge774ov13675;
T0* ge774ov13676;
T0* ge774ov13677;
T0* ge774ov13678;
T0* ge774ov13679;
T0* ge774ov13680;
T0* ge774ov13681;
T0* ge774ov13682;
T0* ge774ov13686;
T0* ge774ov13687;
T0* ge774ov13667;
T0* ge774ov13668;
T0* ge774ov13669;
T0* ge774ov13670;
T0* ge774ov13685;
T0* ge800ov20831;
T0* ge800ov20830;
T0* ge805ov22615;
T0* ge815ov22507;
T0* ge1018ov3850;
T0* ge1015ov3850;
T0* ge231ov3850;
T0* ge230ov3850;
T0* ge1009ov3850;
T0* ge1025ov3850;
T0* ge1022ov3850;
T0* ge1021ov3850;
T0* ge1017ov3850;
T0* ge1024ov3850;
T0* ge1016ov3850;
T0* ge1028ov3850;
T0* ge1012ov3850;
T0* ge1023ov3850;
T0* ge1027ov3850;
T0* ge1019ov3850;
T0* ge1010ov3850;
T0* ge225ov3850;
T0* ge228ov3850;
T0* ge235ov3850;
T0* ge224ov3850;
T0* ge409ov24738;
T0* ge396ov1685;

void GE_const_init()
{
	ge408ov9076 = (GE_ms("\n", 1));
	ge412ov2776 = (GE_ms("", 0));
	ge351ov24652 = (GE_ms("", 0));
	ge418ov9645 = (GE_ms("", 0));
	ge385ov1705 = (GE_ms("empty_name", 10));
	ge1150ov16436 = (GE_ms("no pattern compiled", 19));
	ge1150ov16421 = (GE_ms("unmatched parentheses", 21));
	ge1150ov16414 = (GE_ms("back reference to non-existent subpattern", 41));
	ge1150ov16399 = (GE_ms("compilation successfully", 24));
	ge1150ov16424 = (GE_ms("lookbehind assertion is not fixed length", 40));
	ge1150ov16417 = (GE_ms("missing ) after comment", 23));
	ge1150ov16425 = (GE_ms("malformed number after (\?(", 26));
	ge1150ov16434 = (GE_ms("invalid condition (\?(0)", 23));
	ge1150ov16427 = (GE_ms("assertion expected after (\?(", 28));
	ge1150ov16423 = (GE_ms("unrecognized character after (\?<", 32));
	ge1150ov16411 = (GE_ms("unrecognized character after (\?", 31));
	ge1150ov16412 = (GE_ms("too many capturing parenthesized sub-patterns", 45));
	ge1150ov16426 = (GE_ms("conditional group contains more than two branches", 49));
	ge1150ov16413 = (GE_ms("missing )", 9));
	ge1150ov16400 = (GE_ms("\\ at end of pattern", 19));
	ge1150ov16401 = (GE_ms("\\c at end of pattern", 20));
	ge1150ov16402 = (GE_ms("unrecognized character follows \\", 32));
	ge1150ov16408 = (GE_ms("nothing to repeat", 17));
	ge1150ov16410 = (GE_ms("internal error: unexpected repeat", 33));
	ge1150ov16405 = (GE_ms("missing terminating ] for character class", 41));
	ge1150ov16430 = (GE_ms("POSIX collating elements are not supported", 42));
	ge1150ov16429 = (GE_ms("unknown POSIX class name", 24));
	ge1150ov16406 = (GE_ms("invalid escape sequence in character class", 42));
	ge1150ov16407 = (GE_ms("range out of order in character class", 37));
	ge1150ov16404 = (GE_ms("number too big in {} quantifier", 31));
	ge1150ov16403 = (GE_ms("numbers out of order in {} quantifier", 37));
	ge1146ov16194 = (GE_ms("", 0));
	ge951ov7009 = (GE_ms("#include", 8));
	ge774ov13498 = (GE_ms("item", 4));
	ge774ov13472 = (GE_ms("call", 4));
	ge774ov13410 = (GE_ms("ANY", 3));
	ge774ov13560 = (GE_ms("end", 3));
	ge951ov7018 = (GE_ms("return", 6));
	ge951ov6978 = (GE_ms("GE_boxed", 8));
	ge951ov6934 = (GE_ms("->", 2));
	ge946ov23606 = (GE_ms("giaaa", 5));
	ge946ov23605 = (GE_ms("GIAAA", 5));
	ge946ov23604 = (GE_ms("[$1] internal error.", 20));
	ge774ov13534 = (GE_ms("Current", 7));
	ge951ov6972 = (GE_ms("extern", 6));
	ge951ov6968 = (GE_ms("EIF_TYPE", 8));
	ge951ov7004 = (GE_ms("GE_types", 8));
	ge951ov6947 = (GE_ms("EIF_FALSE", 9));
	ge951ov6967 = (GE_ms("EIF_TRUE", 8));
	ge951ov7025 = (GE_ms("void", 4));
	ge951ov6980 = (GE_ms("GE_const_init", 13));
	ge951ov6983 = (GE_ms("GE_default", 10));
	ge951ov7005 = (GE_ms("GE_void", 7));
	ge951ov6982 = (GE_ms("GE_deep_twin", 12));
	ge951ov6981 = (GE_ms("GE_deep", 7));
	ge951ov7021 = (GE_ms("switch", 6));
	ge951ov6936 = (GE_ms("case", 4));
	ge951ov7010 = (GE_ms("int", 3));
	ge951ov7008 = (GE_ms("if", 2));
	ge951ov6971 = (GE_ms("else", 4));
	ge951ov7007 = (GE_ms("id", 2));
	ge951ov6975 = (GE_ms("GE_alloc", 8));
	ge951ov7019 = (GE_ms("sizeof", 6));
	ge951ov7017 = (GE_ms("memcpy", 6));
	ge951ov6974 = (GE_ms("for", 3));
	ge774ov13537 = (GE_ms("Result", 6));
	ge951ov6992 = (GE_ms("GE_mt", 5));
	ge951ov6990 = (GE_ms("GE_ma", 5));
	ge951ov7023 = (GE_ms("typedef", 7));
	ge951ov7020 = (GE_ms("struct", 6));
	ge951ov6935 = (GE_ms("break", 5));
	ge951ov7022 = (GE_ms("type_id", 7));
	ge951ov6991 = (GE_ms("GE_ms", 5));
	ge951ov6999 = (GE_ms("GE_power", 8));
	ge951ov6940 = (GE_ms("double", 6));
	ge951ov6984 = (GE_ms("GE_floor", 8));
	ge951ov6979 = (GE_ms("GE_ceiling", 10));
	ge951ov6937 = (GE_ms("char", 4));
	ge951ov6970 = (GE_ms("EIF_WIDE_CHAR", 13));
	ge951ov6963 = (GE_ms("EIF_REAL", 8));
	ge951ov6962 = (GE_ms("EIF_POINTER", 11));
	ge951ov6955 = (GE_ms("EIF_IS_WINDOWS", 14));
	ge951ov6954 = (GE_ms("EIF_IS_VMS", 10));
	ge951ov6953 = (GE_ms("EIF_IS_UNIX", 11));
	ge951ov6948 = (GE_ms("EIF_INTEGER", 11));
	ge951ov6943 = (GE_ms("EIF_CHARACTER", 13));
	ge951ov6942 = (GE_ms("EIF_BOOLEAN", 11));
	ge951ov6997 = (GE_ms("GE_object_id", 12));
	ge951ov6985 = (GE_ms("GE_id_object", 12));
	ge951ov6976 = (GE_ms("GE_argc", 7));
	ge951ov7016 = (GE_ms("memcmp", 6));
	ge951ov6998 = (GE_ms("GE_object_id_free", 17));
	ge951ov6969 = (GE_ms("EIF_VOID", 8));
	ge951ov6939 = (GE_ms("#define", 7));
	ge951ov6941 = (GE_ms("EIF_ANY", 7));
	ge951ov7015 = (GE_ms("is_special", 10));
	ge951ov6965 = (GE_ms("EIF_REAL_64", 11));
	ge951ov6964 = (GE_ms("EIF_REAL_32", 11));
	ge951ov6956 = (GE_ms("EIF_NATURAL", 11));
	ge951ov6960 = (GE_ms("EIF_NATURAL_64", 14));
	ge951ov6959 = (GE_ms("EIF_NATURAL_32", 14));
	ge951ov6958 = (GE_ms("EIF_NATURAL_16", 14));
	ge951ov6957 = (GE_ms("EIF_NATURAL_8", 13));
	ge951ov6952 = (GE_ms("EIF_INTEGER_64", 14));
	ge951ov6951 = (GE_ms("EIF_INTEGER_32", 14));
	ge951ov6950 = (GE_ms("EIF_INTEGER_16", 14));
	ge951ov6949 = (GE_ms("EIF_INTEGER_8", 13));
	ge951ov6945 = (GE_ms("EIF_CHARACTER_32", 16));
	ge951ov6944 = (GE_ms("EIF_CHARACTER_8", 15));
	ge951ov6946 = (GE_ms("EIF_DOUBLE", 10));
	ge774ov13418 = (GE_ms("DOUBLE", 6));
	ge774ov13438 = (GE_ms("REAL", 4));
	ge774ov13428 = (GE_ms("NATURAL", 7));
	ge774ov13422 = (GE_ms("INTEGER", 7));
	ge774ov13451 = (GE_ms("WIDE_CHARACTER", 14));
	ge774ov13415 = (GE_ms("CHARACTER", 9));
	ge774ov13556 = (GE_ms("deferred", 8));
	ge410ov9076 = (GE_ms("\n", 1));
	ge949ov23594 = (GE_ms("gvsrc5a", 7));
	ge949ov23588 = (GE_ms("GVSRC5", 6));
	ge949ov23582 = (GE_ms("[$1] root creation procedure `$3\' is not a feature of root class $2.", 68));
	ge949ov23590 = (GE_ms("vsrc1a", 6));
	ge949ov23584 = (GE_ms("VSRC1", 5));
	ge949ov23578 = (GE_ms("[$1] root class $2 should not be generic.", 41));
	ge949ov23593 = (GE_ms("gvsrc4a", 7));
	ge949ov23587 = (GE_ms("GVSRC4", 6));
	ge949ov23581 = (GE_ms("[$1] unknown root class $2.", 27));
	ge949ov23595 = (GE_ms("gvsrc6a", 7));
	ge949ov23589 = (GE_ms("GVSRC6", 6));
	ge949ov23583 = (GE_ms("[$1] root creation procedure `$3\' is not declared as publicly available creation procedure in root class $2.", 108));
	ge774ov13481 = (GE_ms("default_create", 14));
	ge949ov23592 = (GE_ms("gvsrc3a", 7));
	ge949ov23586 = (GE_ms("GVSRC3", 6));
	ge949ov23580 = (GE_ms("[$1] missing root class.", 24));
	ge774ov13523 = (GE_ms("to_pointer", 10));
	ge774ov13506 = (GE_ms("pointer_item", 12));
	ge774ov13532 = (GE_ms("upper", 5));
	ge774ov13500 = (GE_ms("lower", 5));
	ge774ov13479 = (GE_ms("count", 5));
	ge950ov24468 = (GE_ms("gvkfe3a", 7));
	ge950ov24226 = (GE_ms("GVKFE-3", 7));
	ge950ov24090 = (GE_ms("attribute `$7\' in kernel class $5 has not the expected type \'$8\'.", 65));
	ge950ov24466 = (GE_ms("gvkfe1a", 7));
	ge950ov24224 = (GE_ms("GVKFE-1", 7));
	ge950ov24088 = (GE_ms("feature `$7\' is missing in kernel class $5.", 43));
	ge950ov24467 = (GE_ms("gvkfe2a", 7));
	ge950ov24225 = (GE_ms("GVKFE-2", 7));
	ge950ov24089 = (GE_ms("feature `$7\' in kernel class $5 is not an attribute.", 52));
	ge774ov13454 = (GE_ms("area", 4));
	ge949ov23591 = (GE_ms("gvknl1a", 7));
	ge949ov23585 = (GE_ms("GVKNL1", 6));
	ge949ov23579 = (GE_ms("[$1] missing kernel class $2.", 29));
	ge942ov25748 = (GE_ms("gaaaa", 5));
	ge942ov25746 = (GE_ms("GAAAA", 5));
	ge942ov25744 = (GE_ms("[$1] assembly $2: .NET assemblies not supported.", 48));
	ge1074ov4872 = (GE_ms(" \t\r\n", 4));
	ge941ov24521 = (GE_ms("gcaaa", 5));
	ge941ov24517 = (GE_ms("GCAAA", 5));
	ge941ov24513 = (GE_ms("[$1] cluster $2: cannot read cluster directory \'$3\'.", 52));
	ge997ov18624 = (GE_ms("", 0));
	ge386ov8890 = (GE_ms("dummy", 5));
	ge584ov11642 = (GE_ms(".", 1));
	ge584ov11643 = (GE_ms("..", 2));
	ge941ov24522 = (GE_ms("gcaab", 5));
	ge941ov24518 = (GE_ms("GCAAB", 5));
	ge941ov24514 = (GE_ms("[$1] cluster $2: cannot read Eiffel file \'$3\'.", 46));
	ge948ov24530 = (GE_ms("gssss", 5));
	ge948ov24529 = (GE_ms("Syntax error:\n$1", 16));
	ge950ov24423 = (GE_ms("vscn0h", 6));
	ge950ov24197 = (GE_ms("VSCN", 4));
	ge950ov24045 = (GE_ms("built-in class cannot be overridden by class in file \'$8\'.", 58));
	ge950ov24425 = (GE_ms("vscn0j", 6));
	ge950ov24047 = (GE_ms("class in assembly \'$8\' cannot be overridden by class in file \'$10\'.", 67));
	ge950ov24418 = (GE_ms("vscn0c", 6));
	ge950ov24040 = (GE_ms("class appears in file \'$8\' and group \'$10\'.", 43));
	ge950ov24421 = (GE_ms("vscn0f", 6));
	ge950ov24043 = (GE_ms("built-in class also appears in file \'$8\'.", 41));
	ge950ov24417 = (GE_ms("vscn0b", 6));
	ge950ov24039 = (GE_ms("class appears in file \'$8\' and assembly \'$10\'.", 46));
	ge950ov24416 = (GE_ms("vscn0a", 6));
	ge950ov24038 = (GE_ms("class appears in files \'$8\' and \'$10\'.", 38));
	ge774ov13550 = (GE_ms("class", 5));
	ge774ov13452 = (GE_ms("*UNKNOWN*", 9));
	ge774ov13643 = (GE_ms("BOOLEAN_REF", 11));
	ge774ov13644 = (GE_ms("CHARACTER_REF", 13));
	ge774ov13645 = (GE_ms("CHARACTER_8_REF", 15));
	ge774ov13646 = (GE_ms("CHARACTER_32_REF", 16));
	ge774ov13647 = (GE_ms("COMPARABLE", 10));
	ge774ov13648 = (GE_ms("DOUBLE_REF", 10));
	ge774ov13649 = (GE_ms("HASHABLE", 8));
	ge774ov13650 = (GE_ms("INTEGER_REF", 11));
	ge774ov13651 = (GE_ms("INTEGER_8_REF", 13));
	ge774ov13652 = (GE_ms("INTEGER_16_REF", 14));
	ge774ov13653 = (GE_ms("INTEGER_32_REF", 14));
	ge774ov13654 = (GE_ms("INTEGER_64_REF", 14));
	ge774ov13655 = (GE_ms("NATURAL_REF", 11));
	ge774ov13656 = (GE_ms("NATURAL_8_REF", 13));
	ge774ov13657 = (GE_ms("NATURAL_16_REF", 14));
	ge774ov13658 = (GE_ms("NATURAL_32_REF", 14));
	ge774ov13659 = (GE_ms("NATURAL_64_REF", 14));
	ge774ov13660 = (GE_ms("NUMERIC", 7));
	ge774ov13661 = (GE_ms("PART_COMPARABLE", 15));
	ge774ov13662 = (GE_ms("POINTER_REF", 11));
	ge774ov13663 = (GE_ms("REAL_REF", 8));
	ge774ov13664 = (GE_ms("REAL_32_REF", 11));
	ge774ov13665 = (GE_ms("REAL_64_REF", 11));
	ge774ov13666 = (GE_ms("WIDE_CHARACTER_REF", 18));
	ge774ov13708 = (GE_ms("built_in", 8));
	ge774ov13709 = (GE_ms("static built_in", 15));
	ge774ov13710 = (GE_ms("built_in static", 15));
	ge774ov13411 = (GE_ms("ARGUMENTS", 9));
	ge774ov13412 = (GE_ms("ARRAY", 5));
	ge774ov13413 = (GE_ms("BIT", 3));
	ge774ov13414 = (GE_ms("BOOLEAN", 7));
	ge774ov13416 = (GE_ms("CHARACTER_8", 11));
	ge774ov13417 = (GE_ms("CHARACTER_32", 12));
	ge774ov13419 = (GE_ms("FUNCTION", 8));
	ge774ov13420 = (GE_ms("GENERAL", 7));
	ge774ov13421 = (GE_ms("IDENTIFIED_ROUTINES", 19));
	ge774ov13423 = (GE_ms("INTEGER_8", 9));
	ge774ov13424 = (GE_ms("INTEGER_16", 10));
	ge774ov13425 = (GE_ms("INTEGER_32", 10));
	ge774ov13426 = (GE_ms("INTEGER_64", 10));
	ge774ov13427 = (GE_ms("NATIVE_ARRAY", 12));
	ge774ov13429 = (GE_ms("NATURAL_8", 9));
	ge774ov13430 = (GE_ms("NATURAL_16", 10));
	ge774ov13431 = (GE_ms("NATURAL_32", 10));
	ge774ov13432 = (GE_ms("NATURAL_64", 10));
	ge774ov13433 = (GE_ms("NONE", 4));
	ge774ov13434 = (GE_ms("PLATFORM", 8));
	ge774ov13435 = (GE_ms("POINTER", 7));
	ge774ov13436 = (GE_ms("PREDICATE", 9));
	ge774ov13437 = (GE_ms("PROCEDURE", 9));
	ge774ov13439 = (GE_ms("REAL_32", 7));
	ge774ov13440 = (GE_ms("REAL_64", 7));
	ge774ov13441 = (GE_ms("ROUTINE", 7));
	ge774ov13442 = (GE_ms("SPECIAL", 7));
	ge774ov13443 = (GE_ms("STRING", 6));
	ge774ov13444 = (GE_ms("STRING_8", 8));
	ge774ov13445 = (GE_ms("STRING_32", 9));
	ge774ov13446 = (GE_ms("SYSTEM_OBJECT", 13));
	ge774ov13447 = (GE_ms("SYSTEM_STRING", 13));
	ge774ov13448 = (GE_ms("TUPLE", 5));
	ge774ov13449 = (GE_ms("TYPE", 4));
	ge774ov13450 = (GE_ms("TYPED_POINTER", 13));
	ge774ov13453 = (GE_ms("aliased_resized_area", 20));
	ge774ov13455 = (GE_ms("argument", 8));
	ge774ov13456 = (GE_ms("argument_count", 14));
	ge774ov13461 = (GE_ms("as_natural_8", 12));
	ge774ov13462 = (GE_ms("as_natural_16", 13));
	ge774ov13463 = (GE_ms("as_natural_32", 13));
	ge774ov13464 = (GE_ms("as_natural_64", 13));
	ge774ov13457 = (GE_ms("as_integer_8", 12));
	ge774ov13458 = (GE_ms("as_integer_16", 13));
	ge774ov13459 = (GE_ms("as_integer_32", 13));
	ge774ov13460 = (GE_ms("as_integer_64", 13));
	ge774ov13465 = (GE_ms("bit_and", 7));
	ge774ov13466 = (GE_ms("bit_not", 7));
	ge774ov13467 = (GE_ms("bit_or", 6));
	ge774ov13468 = (GE_ms("bit_shift_left", 14));
	ge774ov13469 = (GE_ms("bit_shift_right", 15));
	ge774ov13470 = (GE_ms("bit_xor", 7));
	ge774ov13471 = (GE_ms("boolean_bytes", 13));
	ge774ov13473 = (GE_ms("ceiling_real_32", 15));
	ge774ov13474 = (GE_ms("ceiling_real_64", 15));
	ge774ov13475 = (GE_ms("character_bytes", 15));
	ge774ov13476 = (GE_ms("code", 4));
	ge774ov13477 = (GE_ms("conforms_to", 11));
	ge774ov13478 = (GE_ms("copy", 4));
	ge774ov13480 = (GE_ms("deep_twin", 9));
	ge774ov13482 = (GE_ms("eif_id_object", 13));
	ge774ov13483 = (GE_ms("eif_object_id", 13));
	ge774ov13484 = (GE_ms("eif_object_id_free", 18));
	ge774ov13485 = (GE_ms("element_size", 12));
	ge774ov13486 = (GE_ms("floor_real_32", 13));
	ge774ov13487 = (GE_ms("floor_real_64", 13));
	ge774ov13488 = (GE_ms("generating_type", 15));
	ge774ov13489 = (GE_ms("generator", 9));
	ge774ov13490 = (GE_ms("hash_code", 9));
	ge774ov13491 = (GE_ms("integer_bytes", 13));
	ge774ov13492 = (GE_ms("is_deep_equal", 13));
	ge774ov13493 = (GE_ms("is_dotnet", 9));
	ge774ov13494 = (GE_ms("is_thread_capable", 17));
	ge774ov13495 = (GE_ms("is_unix", 7));
	ge774ov13496 = (GE_ms("is_vms", 6));
	ge774ov13497 = (GE_ms("is_windows", 10));
	ge774ov13499 = (GE_ms("last_result", 11));
	ge774ov13501 = (GE_ms("make", 4));
	ge774ov13502 = (GE_ms("name", 4));
	ge774ov13503 = (GE_ms("natural_32_code", 15));
	ge774ov13504 = (GE_ms("out", 3));
	ge774ov13505 = (GE_ms("pointer_bytes", 13));
	ge774ov13507 = (GE_ms("put", 3));
	ge774ov13508 = (GE_ms("put_reference", 13));
	ge774ov13509 = (GE_ms("real_bytes", 10));
	ge774ov13510 = (GE_ms("reference_item", 14));
	ge774ov13511 = (GE_ms("same_type", 9));
	ge774ov13512 = (GE_ms("set_item", 8));
	ge774ov13513 = (GE_ms("set_operands", 12));
	ge774ov13514 = (GE_ms("standard_copy", 13));
	ge774ov13515 = (GE_ms("standard_is_equal", 17));
	ge774ov13516 = (GE_ms("standard_twin", 13));
	ge774ov13517 = (GE_ms("tagged_out", 10));
	ge774ov13518 = (GE_ms("to_character", 12));
	ge774ov13519 = (GE_ms("to_character_8", 14));
	ge774ov13520 = (GE_ms("to_character_32", 15));
	ge774ov13521 = (GE_ms("to_double", 9));
	ge774ov13522 = (GE_ms("to_integer_32", 13));
	ge774ov13524 = (GE_ms("to_real", 7));
	ge774ov13525 = (GE_ms("to_real_32", 10));
	ge774ov13526 = (GE_ms("to_real_64", 10));
	ge774ov13527 = (GE_ms("truncated_to_integer", 20));
	ge774ov13528 = (GE_ms("truncated_to_integer_64", 23));
	ge774ov13529 = (GE_ms("truncated_to_real", 17));
	ge774ov13530 = (GE_ms("twin", 4));
	ge774ov13531 = (GE_ms("type_id", 7));
	ge774ov13533 = (GE_ms("wide_character_bytes", 20));
	ge774ov13535 = (GE_ms("False", 5));
	ge774ov13536 = (GE_ms("Precursor", 9));
	ge774ov13538 = (GE_ms("True", 4));
	ge774ov13539 = (GE_ms("Void", 4));
	ge774ov13540 = (GE_ms("Unique", 6));
	ge774ov13541 = (GE_ms("agent", 5));
	ge774ov13542 = (GE_ms("alias", 5));
	ge774ov13543 = (GE_ms("all", 3));
	ge774ov13544 = (GE_ms("and", 3));
	ge774ov13546 = (GE_ms("as", 2));
	ge774ov13547 = (GE_ms("assign", 6));
	ge774ov13548 = (GE_ms("attribute", 9));
	ge774ov13549 = (GE_ms("check", 5));
	ge774ov13551 = (GE_ms("convert", 7));
	ge774ov13552 = (GE_ms("create", 6));
	ge774ov13553 = (GE_ms("creation", 8));
	ge774ov13554 = (GE_ms("current", 7));
	ge774ov13555 = (GE_ms("debug", 5));
	ge774ov13557 = (GE_ms("do", 2));
	ge774ov13558 = (GE_ms("else", 4));
	ge774ov13559 = (GE_ms("elseif", 6));
	ge774ov13561 = (GE_ms("ensure", 6));
	ge774ov13562 = (GE_ms("expanded", 8));
	ge774ov13563 = (GE_ms("export", 6));
	ge774ov13564 = (GE_ms("external", 8));
	ge774ov13565 = (GE_ms("false", 5));
	ge774ov13566 = (GE_ms("feature", 7));
	ge774ov13567 = (GE_ms("from", 4));
	ge774ov13568 = (GE_ms("frozen", 6));
	ge774ov13569 = (GE_ms("if", 2));
	ge774ov13570 = (GE_ms("implies", 7));
	ge774ov13571 = (GE_ms("indexing", 8));
	ge774ov13572 = (GE_ms("infix", 5));
	ge774ov13573 = (GE_ms("inherit", 7));
	ge774ov13574 = (GE_ms("inspect", 7));
	ge774ov13575 = (GE_ms("invariant", 9));
	ge774ov13576 = (GE_ms("is", 2));
	ge774ov13577 = (GE_ms("like", 4));
	ge774ov13578 = (GE_ms("local", 5));
	ge774ov13579 = (GE_ms("loop", 4));
	ge774ov13580 = (GE_ms("not", 3));
	ge774ov13581 = (GE_ms("obsolete", 8));
	ge774ov13582 = (GE_ms("old", 3));
	ge774ov13583 = (GE_ms("once", 4));
	ge774ov13584 = (GE_ms("or", 2));
	ge774ov13586 = (GE_ms("precursor", 9));
	ge774ov13587 = (GE_ms("prefix", 6));
	ge774ov13588 = (GE_ms("redefine", 8));
	ge774ov13589 = (GE_ms("recast", 6));
	ge774ov13590 = (GE_ms("reference", 9));
	ge774ov13591 = (GE_ms("rename", 6));
	ge774ov13592 = (GE_ms("require", 7));
	ge774ov13593 = (GE_ms("rescue", 6));
	ge774ov13594 = (GE_ms("result", 6));
	ge774ov13595 = (GE_ms("retry", 5));
	ge774ov13596 = (GE_ms("select", 6));
	ge774ov13597 = (GE_ms("separate", 8));
	ge774ov13598 = (GE_ms("strip", 5));
	ge774ov13599 = (GE_ms("then", 4));
	ge774ov13600 = (GE_ms("true", 4));
	ge774ov13601 = (GE_ms("undefine", 8));
	ge774ov13602 = (GE_ms("unique", 6));
	ge774ov13603 = (GE_ms("until", 5));
	ge774ov13604 = (GE_ms("variant", 7));
	ge774ov13605 = (GE_ms("void", 4));
	ge774ov13606 = (GE_ms("when", 4));
	ge774ov13607 = (GE_ms("xor", 3));
	ge774ov13608 = (GE_ms("->", 2));
	ge774ov13609 = (GE_ms(":=", 2));
	ge774ov13610 = (GE_ms("\?=", 2));
	ge774ov13611 = (GE_ms("@", 1));
	ge774ov13612 = (GE_ms("!", 1));
	ge774ov13613 = (GE_ms(":", 1));
	ge774ov13614 = (GE_ms(",", 1));
	ge774ov13615 = (GE_ms("//", 2));
	ge774ov13616 = (GE_ms("/", 1));
	ge774ov13617 = (GE_ms("$", 1));
	ge774ov13618 = (GE_ms(".", 1));
	ge774ov13619 = (GE_ms("..", 2));
	ge774ov13620 = (GE_ms("=", 1));
	ge774ov13621 = (GE_ms(">=", 2));
	ge774ov13622 = (GE_ms(">", 1));
	ge774ov13623 = (GE_ms("<=", 2));
	ge774ov13624 = (GE_ms("<<", 2));
	ge774ov13625 = (GE_ms("{", 1));
	ge774ov13626 = (GE_ms("[", 1));
	ge774ov13627 = (GE_ms("(", 1));
	ge774ov13628 = (GE_ms("<", 1));
	ge774ov13629 = (GE_ms("-", 1));
	ge774ov13630 = (GE_ms("\\\\", 2));
	ge774ov13631 = (GE_ms("/=", 2));
	ge774ov13632 = (GE_ms("+", 1));
	ge774ov13633 = (GE_ms("^", 1));
	ge774ov13634 = (GE_ms("\?", 1));
	ge774ov13635 = (GE_ms(">>", 2));
	ge774ov13636 = (GE_ms("}", 1));
	ge774ov13637 = (GE_ms("]", 1));
	ge774ov13638 = (GE_ms(")", 1));
	ge774ov13639 = (GE_ms(";", 1));
	ge774ov13640 = (GE_ms("~", 1));
	ge774ov13641 = (GE_ms("*", 1));
	ge287ov11568 = (GE_ms("", 0));
	ge383ov20349 = (GE_ms("se", 2));
	ge383ov20346 = (GE_ms("ge", 2));
	ge962ov15199 = (GE_ms("dummy", 5));
	ge381ov20213 = (GE_ms("", 0));
	ge950ov24434 = (GE_ms("vtbt0d", 6));
	ge950ov24200 = (GE_ms("VTBT", 4));
	ge950ov24056 = (GE_ms("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge950ov24433 = (GE_ms("vtbt0c", 6));
	ge950ov24055 = (GE_ms("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge950ov24465 = (GE_ms("gvkbu1a", 7));
	ge950ov24223 = (GE_ms("GVKBU-1", 7));
	ge950ov24087 = (GE_ms("unknown built-in routine `$7\' in class $5.", 42));
	ge950ov24464 = (GE_ms("gvkbs0a", 7));
	ge950ov24222 = (GE_ms("GVKBS", 5));
	ge950ov24086 = (GE_ms("built-in routine `$7\' in class $5 has not the expected signature \'$8\'.", 70));
	ge774ov13585 = (GE_ms("or else", 7));
	ge774ov13545 = (GE_ms("and then", 8));
	ge950ov24470 = (GE_ms("gvkfe5a", 7));
	ge950ov24228 = (GE_ms("GVKFE-5", 7));
	ge950ov24092 = (GE_ms("feature `$7\' in kernel class $5 is not a query.", 47));
	ge950ov24469 = (GE_ms("gvkfe4a", 7));
	ge950ov24227 = (GE_ms("GVKFE-4", 7));
	ge950ov24091 = (GE_ms("feature `$7\' in kernel class $5 is not a procedure.", 51));
	ge1264ov10284 = (GE_ms("undefined", 9));
	ge1264ov10283 = (GE_ms("(TRUNCATED)", 11));
	ge1007ov4168 = (GE_ms("abstract", 8));
	ge1007ov4169 = (GE_ms("address_expression", 18));
	ge1007ov4170 = (GE_ms("arguments", 9));
	ge1007ov4171 = (GE_ms("array_optimization", 18));
	ge1007ov4172 = (GE_ms("assembly", 8));
	ge1007ov4173 = (GE_ms("assertion", 9));
	ge1007ov4174 = (GE_ms("callback", 8));
	ge1007ov4175 = (GE_ms("case_insensitive", 16));
	ge1007ov4176 = (GE_ms("check_vape", 10));
	ge1007ov4177 = (GE_ms("clean", 5));
	ge1007ov4178 = (GE_ms("cls_compliant", 13));
	ge1007ov4179 = (GE_ms("component", 9));
	ge1007ov4180 = (GE_ms("console_application", 19));
	ge1007ov4181 = (GE_ms("create_keyword_extension", 24));
	ge1007ov4182 = (GE_ms("culture", 7));
	ge1007ov4183 = (GE_ms("c_compiler_options", 18));
	ge1007ov4184 = (GE_ms("dead_code_removal", 17));
	ge1007ov4185 = (GE_ms("debug", 5));
	ge1007ov4186 = (GE_ms("debug_tag", 9));
	ge1007ov4187 = (GE_ms("debugger", 8));
	ge1007ov4188 = (GE_ms("document", 8));
	ge1007ov4189 = (GE_ms("dotnet_naming_convention", 24));
	ge1007ov4190 = (GE_ms("dynamic_runtime", 15));
	ge1007ov4191 = (GE_ms("exception_trace", 15));
	ge1007ov4192 = (GE_ms("exclude", 7));
	ge1007ov4193 = (GE_ms("export", 6));
	ge1007ov4194 = (GE_ms("finalize", 8));
	ge1007ov4195 = (GE_ms("flat_fst_optimization", 21));
	ge1007ov4196 = (GE_ms("fst_expansion_factor", 20));
	ge1007ov4197 = (GE_ms("fst_optimization", 16));
	ge1007ov4198 = (GE_ms("garbage_collector", 17));
	ge1007ov4199 = (GE_ms("gc_info", 7));
	ge1007ov4200 = (GE_ms("heap_size", 9));
	ge1007ov4201 = (GE_ms("header", 6));
	ge1007ov4202 = (GE_ms("high_memory_compiler", 20));
	ge1007ov4203 = (GE_ms("il_verifiable", 13));
	ge1007ov4204 = (GE_ms("include", 7));
	ge1007ov4205 = (GE_ms("inlining", 8));
	ge1007ov4206 = (GE_ms("inlining_size", 13));
	ge1007ov4207 = (GE_ms("jumps_optimization", 18));
	ge1007ov4208 = (GE_ms("layout", 6));
	ge1007ov4209 = (GE_ms("layout_optimization", 19));
	ge1007ov4210 = (GE_ms("leaves_optimization", 19));
	ge1007ov4211 = (GE_ms("line_generation", 15));
	ge1007ov4212 = (GE_ms("link", 4));
	ge1007ov4213 = (GE_ms("linker", 6));
	ge1007ov4214 = (GE_ms("linux_fpu_double_precision", 26));
	ge1007ov4215 = (GE_ms("manifest_string_trace", 21));
	ge1007ov4216 = (GE_ms("map", 3));
	ge1007ov4217 = (GE_ms("metadata_cache_path", 19));
	ge1007ov4218 = (GE_ms("msil_assembly_compatibility", 27));
	ge1007ov4219 = (GE_ms("msil_clr_version", 16));
	ge1007ov4220 = (GE_ms("msil_generation", 15));
	ge1007ov4221 = (GE_ms("msil_generation_version", 23));
	ge1007ov4222 = (GE_ms("multithreaded", 13));
	ge1007ov4223 = (GE_ms("namespace", 9));
	ge1007ov4224 = (GE_ms("no_default_lib", 14));
	ge1007ov4225 = (GE_ms("override_cluster", 16));
	ge1007ov4226 = (GE_ms("portable_code_generation", 24));
	ge1007ov4227 = (GE_ms("precompiled", 11));
	ge1007ov4228 = (GE_ms("prefix", 6));
	ge1007ov4229 = (GE_ms("profile", 7));
	ge1007ov4230 = (GE_ms("public_key_token", 16));
	ge1007ov4231 = (GE_ms("read_only", 9));
	ge1007ov4232 = (GE_ms("recursive", 9));
	ge1007ov4233 = (GE_ms("reloads_optimization", 20));
	ge1007ov4234 = (GE_ms("shared_library_definition", 25));
	ge1007ov4235 = (GE_ms("split", 5));
	ge1007ov4236 = (GE_ms("stack_size", 10));
	ge1007ov4237 = (GE_ms("storable", 8));
	ge1007ov4238 = (GE_ms("storable_filename", 17));
	ge1007ov4239 = (GE_ms("strip", 5));
	ge1007ov4240 = (GE_ms("target", 6));
	ge1007ov4241 = (GE_ms("trace", 5));
	ge1007ov4242 = (GE_ms("use_cluster_name_as_namespace", 29));
	ge1007ov4243 = (GE_ms("use_full_cluster_name_as_namespace", 34));
	ge1007ov4244 = (GE_ms("verbose", 7));
	ge1007ov4245 = (GE_ms("version", 7));
	ge1007ov4246 = (GE_ms("visible_filename", 16));
	ge1007ov4247 = (GE_ms("warning", 7));
	ge1007ov4248 = (GE_ms("wedit", 5));
	ge1040ov4135 = (GE_ms("", 0));
	ge1007ov4354 = (GE_ms("require", 7));
	ge1007ov4341 = (GE_ms("ensure", 6));
	ge1007ov4346 = (GE_ms("invariant", 9));
	ge1007ov4347 = (GE_ms("loop_invariant", 14));
	ge1007ov4348 = (GE_ms("loop_variant", 12));
	ge1007ov4335 = (GE_ms("check", 5));
	ge1007ov4352 = (GE_ms("none", 4));
	ge1007ov4356 = (GE_ms("style", 5));
	ge1007ov4339 = (GE_ms("default", 7));
	ge1007ov4331 = (GE_ms("all", 3));
	ge1007ov4342 = (GE_ms("exe", 3));
	ge1007ov4340 = (GE_ms("dll", 3));
	ge1007ov4337 = (GE_ms("com", 3));
	ge1007ov4351 = (GE_ms("no_main", 7));
	ge1007ov4350 = (GE_ms("microsoft", 9));
	ge1007ov4333 = (GE_ms("auto", 4));
	ge1007ov4355 = (GE_ms("sequential", 10));
	ge1007ov4332 = (GE_ms("array", 5));
	ge1007ov4338 = (GE_ms("constant", 8));
	ge1007ov4353 = (GE_ms("once", 4));
	ge1007ov4345 = (GE_ms("internal", 8));
	ge1007ov4334 = (GE_ms("boehm", 5));
	ge1007ov4349 = (GE_ms("low_level", 9));
	ge1007ov4343 = (GE_ms("feature", 7));
	ge1007ov4336 = (GE_ms("class", 5));
	ge1007ov4358 = (GE_ms("winapi", 6));
	ge1007ov4344 = (GE_ms("generate", 8));
	ge1040ov4134 = (GE_ms("false", 5));
	ge1040ov4133 = (GE_ms("true", 4));
	ge1003ov17752 = (GE_ms("", 0));
	ge1271ov10821 = (GE_ms("PE reference only allowed in DTD", 32));
	ge1271ov10783 = (GE_ms("< not allowed in attribute value", 32));
	ge1271ov10781 = (GE_ms("-- not allowed in comment", 25));
	ge1271ov10822 = (GE_ms("xml prefix reserved in processing instruction", 45));
	ge1271ov10794 = (GE_ms("Misformed XML Declaration", 25));
	ge1271ov10793 = (GE_ms("Misplaced markup declaration", 28));
	ge1271ov10804 = (GE_ms("End tag does not match start tag", 32));
	ge1271ov10798 = (GE_ms("Missing element end tag", 23));
	ge1271ov10797 = (GE_ms("Error in element content", 24));
	ge1271ov10796 = (GE_ms("Misformed start tag", 19));
	ge1271ov10802 = (GE_ms("Attribute declared twice", 24));
	ge1271ov10801 = (GE_ms("Misformed attribute in tag", 26));
	ge1271ov10803 = (GE_ms("Error in end tag", 16));
	ge1271ov10780 = (GE_ms("]]> not allowed in content", 26));
	ge1271ov10806 = (GE_ms("Error in XML declaration", 24));
	ge1271ov10815 = (GE_ms("Misformed element type declaration", 34));
	ge1274ov10636 = (GE_ms("*", 1));
	ge1274ov10634 = (GE_ms("+", 1));
	ge1274ov10635 = (GE_ms("\?", 1));
	ge1271ov10816 = (GE_ms("Misformed attribute list declaration", 36));
	ge1271ov10817 = (GE_ms("Misformed attribute definition declaration", 42));
	ge1271ov10820 = (GE_ms("Misformed conditional section", 29));
	ge1271ov10818 = (GE_ms("Misformed entity declaration", 28));
	ge1271ov10819 = (GE_ms("Misformed entity notation", 25));
	ge1271ov10813 = (GE_ms("Parser is not configured to support external DTDs", 49));
	ge1267ov19879 = (GE_ms("1.0", 3));
	ge1267ov19880 = (GE_ms("utf-8", 5));
	ge1271ov10786 = (GE_ms("unsupported character encoding", 30));
	ge1271ov10809 = (GE_ms("External reference in quoted value", 34));
	ge1271ov10829 = (GE_ms("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1271ov10830 = (GE_ms("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1271ov10831 = (GE_ms("Invalid UTF8 character sequence", 31));
	ge1271ov10824 = (GE_ms("Name misformed", 14));
	ge1271ov10807 = (GE_ms("Literal entity expected in attribute", 36));
	ge1271ov10808 = (GE_ms("Entity is not defined", 21));
	ge1271ov10810 = (GE_ms("Entity cannot be recursively included", 37));
	ge1271ov10814 = (GE_ms("Undefined PE entity", 19));
	ge62ov3836 = (GE_ms("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge62ov3842 = (GE_ms("APIPAR", 6));
	ge60ov4070 = (GE_ms("usage: ", 7));
	ge321ov1579 = (GE_ms("3.6", 3));
	ge59ov3324 = (GE_ms("Errors parsing arguments, aborting.", 35));
	ge62ov3837 = (GE_ms("The mandatory option \'$1\' is missing.", 37));
	ge62ov3843 = (GE_ms("APMOPT", 6));
	ge62ov3838 = (GE_ms("The option \'$1\' is missing a parameter.", 39));
	ge62ov3844 = (GE_ms("APMPAR", 6));
	ge62ov3839 = (GE_ms("Unknown option \'$1\'.", 20));
	ge62ov3845 = (GE_ms("APUOPT", 6));
	ge62ov3840 = (GE_ms("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge62ov3846 = (GE_ms("APUPAR", 6));
	ge59ov3319 = (GE_ms("help", 4));
	ge59ov3318 = (GE_ms("Display this help text.", 23));
	ge59ov3326 = (GE_ms("parameters ...", 14));
	ge59ov3325 = (GE_ms("", 0));
	ge1278ov19589 = (GE_ms(" ", 1));
	ge1278ov19590 = (GE_ms("  ", 2));
	ge1269ov24660 = (GE_ms("iso-8859-1", 10));
	ge1269ov24662 = (GE_ms("utf-16", 6));
	ge950ov24448 = (GE_ms("vuar2b", 6));
	ge950ov24208 = (GE_ms("VUAR-2", 6));
	ge950ov24070 = (GE_ms("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge950ov24447 = (GE_ms("vuar2a", 6));
	ge950ov24069 = (GE_ms("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge950ov24271 = (GE_ms("vdpr4b", 6));
	ge950ov24120 = (GE_ms("VDPR-4B", 7));
	ge950ov23893 = (GE_ms("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$7\' in class $8.", 140));
	ge950ov24445 = (GE_ms("vuar1b", 6));
	ge950ov24207 = (GE_ms("VUAR-1", 6));
	ge950ov24067 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge950ov24444 = (GE_ms("vuar1a", 6));
	ge950ov24066 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge950ov24270 = (GE_ms("vdpr4a", 6));
	ge950ov24119 = (GE_ms("VDPR-4A", 7));
	ge950ov23892 = (GE_ms("the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$7\' in class $8.", 127));
	ge950ov24238 = (GE_ms("vape0b", 6));
	ge950ov24105 = (GE_ms("VAPE", 4));
	ge950ov23860 = (GE_ms("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge950ov24237 = (GE_ms("vape0a", 6));
	ge950ov23859 = (GE_ms("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge950ov24450 = (GE_ms("vuex1a", 6));
	ge950ov24210 = (GE_ms("VUEX-1", 6));
	ge950ov24072 = (GE_ms("`$7\' is not the final name of a feature in class $5.", 52));
	ge950ov24475 = (GE_ms("gvual0a", 7));
	ge950ov24231 = (GE_ms("GVUAL", 5));
	ge950ov24097 = (GE_ms("`$7\' is a local variable of feature `$8\' and hence cannot have actual arguments.", 80));
	ge950ov24476 = (GE_ms("gvual0b", 7));
	ge950ov24098 = (GE_ms("`$7\' is a local variable of an inline agent and hence cannot have actual arguments.", 83));
	ge950ov24473 = (GE_ms("gvuaa0a", 7));
	ge950ov24230 = (GE_ms("GVUAA", 5));
	ge950ov24095 = (GE_ms("`$7\' is a formal argument of feature `$8\' and hence cannot have actual arguments.", 81));
	ge950ov24474 = (GE_ms("gvuaa0b", 7));
	ge950ov24096 = (GE_ms("`$7\' is a formal argument of an inline agent and hence cannot have actual arguments.", 84));
	ge950ov24366 = (GE_ms("vkcn2c", 6));
	ge950ov24165 = (GE_ms("VKCN-2", 6));
	ge950ov23988 = (GE_ms("procedure `$8\' appears in a call expression.", 44));
	ge950ov24479 = (GE_ms("gvuil0a", 7));
	ge950ov24233 = (GE_ms("GVUIL", 5));
	ge950ov24101 = (GE_ms("`$7\' is a local variable of feature `$8\' and hence cannot be an instruction.", 76));
	ge950ov24480 = (GE_ms("gvuil0b", 7));
	ge950ov24102 = (GE_ms("`$7\' is a local variable of an inline agent and hence cannot be an instruction.", 79));
	ge950ov24477 = (GE_ms("gvuia0a", 7));
	ge950ov24232 = (GE_ms("GVUIA", 5));
	ge950ov24099 = (GE_ms("`$7\' is a formal argument of feature `$8\' and hence cannot be an instruction.", 77));
	ge950ov24478 = (GE_ms("gvuia0b", 7));
	ge950ov24100 = (GE_ms("`$7\' is a formal argument of an inline agent and hence cannot be an instruction.", 80));
	ge950ov24364 = (GE_ms("vkcn1c", 6));
	ge950ov24164 = (GE_ms("VKCN-1", 6));
	ge950ov23986 = (GE_ms("query `$8\' appears in a call instruction.", 41));
	ge950ov24302 = (GE_ms("veen2c", 6));
	ge950ov24136 = (GE_ms("VEEN-2", 6));
	ge950ov23924 = (GE_ms("local entity `$7\' appears in the precondition or postcondition of feature `$8\'.", 79));
	ge950ov24304 = (GE_ms("veen2e", 6));
	ge950ov23926 = (GE_ms("local entity `$7\' appears in the precondition or postcondition of an inline agent.", 82));
	ge950ov24300 = (GE_ms("veen2a", 6));
	ge950ov23922 = (GE_ms("entity \'Result\' appears in the body, postcondition or rescue clause of a procedure `$7\'.", 88));
	ge950ov24306 = (GE_ms("veen2g", 6));
	ge950ov23928 = (GE_ms("entity \'Result\' appears in the body, postcondition or rescue clause of an inline agent whose associated feature is a procedure.", 127));
	ge950ov24303 = (GE_ms("veen2d", 6));
	ge950ov23925 = (GE_ms("entity \'Result\' appears in the invariant of the class.", 54));
	ge950ov24301 = (GE_ms("veen2b", 6));
	ge950ov23923 = (GE_ms("entity \'Result\' appears in the precondition of feature `$7\'.", 60));
	ge950ov24346 = (GE_ms("vhpr1a", 6));
	ge950ov24147 = (GE_ms("VHPR-1", 6));
	ge950ov23968 = (GE_ms("inheritance cycle $7.", 21));
	ge950ov24256 = (GE_ms("vcfg3j", 6));
	ge950ov24113 = (GE_ms("VCFG-3", 6));
	ge950ov23878 = (GE_ms("formal generic constraint cycle $7.", 35));
	ge950ov24254 = (GE_ms("vcfg3g", 6));
	ge950ov23876 = (GE_ms("formal generic constraint cycle $7.", 35));
	ge950ov24248 = (GE_ms("vcfg2a", 6));
	ge950ov24112 = (GE_ms("VCFG-2", 6));
	ge950ov23870 = (GE_ms("\'$7\' is the name of formal generic parameters #$7 and #$8.", 58));
	ge950ov24247 = (GE_ms("vcfg1a", 6));
	ge950ov24111 = (GE_ms("VCFG-1", 6));
	ge950ov23869 = (GE_ms("formal generic parameter \'$7\' has the same name as a class in the surrounding universe.", 87));
	ge950ov24459 = (GE_ms("gvagp0a", 7));
	ge950ov24217 = (GE_ms("GVAGP", 5));
	ge950ov24081 = (GE_ms("ancestors with generic parameter mismatch: \'$7\' and \'$8\'.", 57));
	ge950ov24463 = (GE_ms("gvhso2a", 7));
	ge950ov24221 = (GE_ms("GVHSO-2", 7));
	ge950ov24085 = (GE_ms("implicitly inherits from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.", 83));
	ge950ov24438 = (GE_ms("vtct0a", 6));
	ge950ov24203 = (GE_ms("VTCT", 4));
	ge950ov24060 = (GE_ms("type based on unknown class $7.", 31));
	ge950ov24462 = (GE_ms("gvhso1a", 7));
	ge950ov24220 = (GE_ms("GVHSO-1", 7));
	ge950ov24084 = (GE_ms("implicitly inherits from unknown class SYSTEM_OBJECT.", 53));
	ge950ov24345 = (GE_ms("vhay0a", 6));
	ge950ov24155 = (GE_ms("VHAY", 4));
	ge950ov23967 = (GE_ms("implicitly inherits from unknown class ANY.", 43));
	ge950ov24347 = (GE_ms("vhpr1b", 6));
	ge950ov23969 = (GE_ms("inheritance cycle when inheriting from $7.", 42));
	ge950ov24453 = (GE_ms("vwbe0a", 6));
	ge950ov24212 = (GE_ms("VWBE", 4));
	ge950ov24075 = (GE_ms("boolean expression of non-BOOLEAN type \'$7\'.", 44));
	ge950ov24440 = (GE_ms("vtgc0a", 6));
	ge950ov24204 = (GE_ms("VTGC", 4));
	ge950ov24062 = (GE_ms("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge950ov24441 = (GE_ms("vtgc0b", 6));
	ge950ov24063 = (GE_ms("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge950ov24344 = (GE_ms("vgcp3c", 6));
	ge950ov24154 = (GE_ms("VGCP-3", 6));
	ge950ov23966 = (GE_ms("procedure name `$7\' appears twice in creation clause of constraint.", 67));
	ge950ov24340 = (GE_ms("vgcp2a", 6));
	ge950ov24153 = (GE_ms("VGCP-2", 6));
	ge950ov23962 = (GE_ms("`$7\' is not the final name of a procedure.", 42));
	ge950ov24341 = (GE_ms("vgcp2b", 6));
	ge950ov23963 = (GE_ms("`$7\' is not the final name of a procedure.", 42));
	ge950ov24332 = (GE_ms("vgcc6a", 6));
	ge950ov24150 = (GE_ms("VGCC-6", 6));
	ge950ov23954 = (GE_ms("`$7\' is the final name of a once-procedure.", 43));
	ge950ov24343 = (GE_ms("vgcp3b", 6));
	ge950ov23965 = (GE_ms("procedure name `$7\' appears in two different creation clauses.", 62));
	ge950ov24342 = (GE_ms("vgcp3a", 6));
	ge950ov23964 = (GE_ms("procedure name `$7\' appears twice in creation clause.", 53));
	ge950ov24339 = (GE_ms("vgcp1a", 6));
	ge950ov24152 = (GE_ms("VGCP-1", 6));
	ge950ov23961 = (GE_ms("deferred class has a creation clause.", 37));
	ge950ov24311 = (GE_ms("vfac4a", 6));
	ge950ov24140 = (GE_ms("VFAC-4", 6));
	ge950ov23933 = (GE_ms("the type of the $10-th argument of assigner procedure `$8\' and of the $9-th argument of query `$7\' do not have the same deanchored form.", 136));
	ge950ov24310 = (GE_ms("vfac3a", 6));
	ge950ov24139 = (GE_ms("VFAC-3", 6));
	ge950ov23932 = (GE_ms("the type of the first argument of assigner procedure `$8\' and the result type of query `$7\' do not have the same deanchored form.", 129));
	ge950ov24309 = (GE_ms("vfac2a", 6));
	ge950ov24138 = (GE_ms("VFAC-2", 6));
	ge950ov23931 = (GE_ms("the number of arguments in assigner procedure `$8\' is not one more than the number of arguments in query `$7\'.", 110));
	ge950ov24308 = (GE_ms("vfac1b", 6));
	ge950ov24137 = (GE_ms("VFAC-1", 6));
	ge950ov23930 = (GE_ms("query `$7\' has an assigner mark `$8\' but this feature is not a procedure.", 73));
	ge950ov24307 = (GE_ms("vfac1a", 6));
	ge950ov23929 = (GE_ms("query `$7\' has an assigner mark `$8\' but there is no feature with that name.", 76));
	ge950ov24246 = (GE_ms("vcch2a", 6));
	ge950ov24110 = (GE_ms("VCCH-2", 6));
	ge950ov23868 = (GE_ms("class is marked as deferred but has no deferred feature.", 56));
	ge950ov24244 = (GE_ms("vcch1a", 6));
	ge950ov24109 = (GE_ms("VCCH-1", 6));
	ge950ov23866 = (GE_ms("class is not marked as deferred but has deferred feature `$7\'.", 62));
	ge950ov24274 = (GE_ms("vdrd2c", 6));
	ge950ov24121 = (GE_ms("VDRD-2", 6));
	ge950ov23896 = (GE_ms("signature of selected feature `$7\' does not conform to the signature of replicated feature `$8\' in parent $9.", 109));
	ge950ov24275 = (GE_ms("vdrd2d", 6));
	ge950ov23897 = (GE_ms("signature of selected feature `$7\' inherited from $8 does not conform to the signature of replicated feature `$9\' in parent $10.", 128));
	ge950ov24258 = (GE_ms("vdjr0b", 6));
	ge950ov24114 = (GE_ms("VDJR", 4));
	ge950ov23880 = (GE_ms("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of argument number $10 differs.", 122));
	ge950ov24257 = (GE_ms("vdjr0a", 6));
	ge950ov23879 = (GE_ms("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Different number of arguments.", 116));
	ge950ov24259 = (GE_ms("vdjr0c", 6));
	ge950ov23881 = (GE_ms("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of result differs.", 109));
	ge950ov24283 = (GE_ms("vdrd6b", 6));
	ge950ov24125 = (GE_ms("VDRD-6", 6));
	ge950ov23905 = (GE_ms("attribute `$7\' inherited from $8 and its redeclared version don\'t have the same type expandedness.", 98));
	ge950ov24272 = (GE_ms("vdrd2a", 6));
	ge950ov23894 = (GE_ms("signature of feature `$7\' does not conform to the signature of redeclared feature `$8\' in parent $9.", 100));
	ge950ov24273 = (GE_ms("vdrd2b", 6));
	ge950ov23895 = (GE_ms("signature of feature `$7\' inherited from $8 does not conform to the signature of redeclared feature `$9\' in parent $10.", 119));
	ge950ov24317 = (GE_ms("vfav1f", 6));
	ge950ov24141 = (GE_ms("VFAV-1", 6));
	ge950ov23939 = (GE_ms("features `$7\' and `$9\' have both the same binary Operator alias `$8\'.", 69));
	ge950ov24314 = (GE_ms("vfav1c", 6));
	ge950ov23936 = (GE_ms("features `$7\' and `$9\' have both the same unary Operator alias `$8\'.", 68));
	ge950ov24321 = (GE_ms("vfav2b", 6));
	ge950ov24142 = (GE_ms("VFAV-2", 6));
	ge950ov23943 = (GE_ms("features `$7\' and `$9\' have both the same Bracket alias `$8\'.", 61));
	ge950ov24318 = (GE_ms("vfav1g", 6));
	ge950ov23940 = (GE_ms("features `$7\' and `$9\' inherited from $11 have both the same binary Operator alias `$8\'.", 88));
	ge950ov24315 = (GE_ms("vfav1d", 6));
	ge950ov23937 = (GE_ms("features `$7\' and `$9\' inherited from $11 have both the same unary Operator alias `$8\'.", 87));
	ge950ov24322 = (GE_ms("vfav2c", 6));
	ge950ov23944 = (GE_ms("features `$7\' and `$9\' inherited from $11 have both the same Bracket alias `$8\'.", 80));
	ge950ov24319 = (GE_ms("vfav1h", 6));
	ge950ov23941 = (GE_ms("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same binary Operator alias `$8\'.", 107));
	ge950ov24316 = (GE_ms("vfav1e", 6));
	ge950ov23938 = (GE_ms("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same unary Operator alias `$8\'.", 106));
	ge950ov24323 = (GE_ms("vfav2d", 6));
	ge950ov23945 = (GE_ms("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Bracket alias `$8\'.", 99));
	ge950ov24430 = (GE_ms("vtat2a", 6));
	ge950ov24199 = (GE_ms("VTAT-2", 6));
	ge950ov24052 = (GE_ms("anchor cycle $7.", 16));
	ge950ov24328 = (GE_ms("vffd7b", 6));
	ge950ov24146 = (GE_ms("VFFD-7", 6));
	ge950ov23950 = (GE_ms("feature `$7\' is a once funtion but its type contains a formal generic parameter.", 80));
	ge950ov24327 = (GE_ms("vffd7a", 6));
	ge950ov23949 = (GE_ms("feature `$7\' is a once funtion but its type contains an anchored type.", 70));
	ge950ov24313 = (GE_ms("vfav1b", 6));
	ge950ov23935 = (GE_ms("feature `$7\' has a unary Operator alias `$8\' but is not a query with no argument.", 81));
	ge950ov24312 = (GE_ms("vfav1a", 6));
	ge950ov23934 = (GE_ms("feature `$7\' has a binary Operator alias `$8\' but is not a query with at exactly one argument.", 94));
	ge950ov24320 = (GE_ms("vfav2a", 6));
	ge950ov23942 = (GE_ms("feature `$7\' has a Bracket alias `$8\' but is not a query with at least one argument.", 84));
	ge950ov24326 = (GE_ms("vffd6a", 6));
	ge950ov24145 = (GE_ms("VFFD-6", 6));
	ge950ov23948 = (GE_ms("feature `$7\' has an Infix name but is not a function with exactly one argument.", 79));
	ge950ov24325 = (GE_ms("vffd5a", 6));
	ge950ov24144 = (GE_ms("VFFD-5", 6));
	ge950ov23947 = (GE_ms("feature `$7\' has a Prefix name but is not an attribute or a function with no argument.", 86));
	ge950ov24324 = (GE_ms("vffd4a", 6));
	ge950ov24143 = (GE_ms("VFFD-4", 6));
	ge950ov23946 = (GE_ms("deferred feature `$7\' is marked as frozen.", 42));
	ge950ov24408 = (GE_ms("vrfa0a", 6));
	ge950ov24192 = (GE_ms("VRFA", 4));
	ge950ov24030 = (GE_ms("argument name \'$7\' in feature `$8\' is also the final name of a feature.", 71));
	ge950ov24406 = (GE_ms("vreg0a", 6));
	ge950ov24191 = (GE_ms("VREG", 4));
	ge950ov24028 = (GE_ms("argument name \'$7\' appear twice in feature `$8\'.", 48));
	ge950ov24261 = (GE_ms("vdjr2b", 6));
	ge950ov24115 = (GE_ms("VDJR-2", 6));
	ge950ov23883 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge950ov24374 = (GE_ms("vmfn2b", 6));
	ge950ov24170 = (GE_ms("VMFN-2", 6));
	ge950ov23996 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge950ov24260 = (GE_ms("vdjr2a", 6));
	ge950ov23882 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge950ov24373 = (GE_ms("vmfn2a", 6));
	ge950ov23995 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge950ov24372 = (GE_ms("vmfn0c", 6));
	ge950ov24169 = (GE_ms("VMFN", 4));
	ge950ov23994 = (GE_ms("two features with the same name `$7\' inherited from $8 and `$9\' inherited from $10.", 83));
	ge950ov24291 = (GE_ms("vdrs4a", 6));
	ge950ov24130 = (GE_ms("VDRS-4", 6));
	ge950ov23913 = (GE_ms("Redefine subclause of $8 lists feature `$7\' but it is not redefined.", 68));
	ge950ov24289 = (GE_ms("vdrs2b", 6));
	ge950ov24128 = (GE_ms("VDRS-2", 6));
	ge950ov23911 = (GE_ms("cannot redefine the constant attribute `$7\'.", 44));
	ge950ov24288 = (GE_ms("vdrs2a", 6));
	ge950ov23910 = (GE_ms("cannot redefine the frozen feature `$7\'.", 40));
	ge950ov24295 = (GE_ms("vdus2b", 6));
	ge950ov24132 = (GE_ms("VDUS-2", 6));
	ge950ov23917 = (GE_ms("cannot undefine the attribute `$7\'.", 35));
	ge950ov24294 = (GE_ms("vdus2a", 6));
	ge950ov23916 = (GE_ms("cannot undefine the frozen feature `$7\'.", 40));
	ge950ov24296 = (GE_ms("vdus3a", 6));
	ge950ov24133 = (GE_ms("VDUS-3", 6));
	ge950ov23918 = (GE_ms("cannot undefine the deferred feature `$7\'.", 42));
	ge950ov24356 = (GE_ms("vhrc4d", 6));
	ge950ov24159 = (GE_ms("VHRC-4", 6));
	ge950ov23978 = (GE_ms("`$7\' has a unary Operator alias `$8\' but `$9\' in $10 is not a query with no argument.", 85));
	ge950ov24355 = (GE_ms("vhrc4c", 6));
	ge950ov23977 = (GE_ms("`$7\' has a binary Operator alias `$8\' but `$9\' in $10 is not a query with exactly one argument.", 95));
	ge950ov24354 = (GE_ms("vhrc4b", 6));
	ge950ov23976 = (GE_ms("`$7\' has a Bracket alias `$8\' but `$9\' in $10 is not a query with at least one argument.", 88));
	ge950ov24353 = (GE_ms("vhrc4a", 6));
	ge950ov23975 = (GE_ms("`$7\' is of the Prefix form but `$8\' in $9 is not an attribute nor a function with no argument.", 94));
	ge950ov24357 = (GE_ms("vhrc5a", 6));
	ge950ov24160 = (GE_ms("VHRC-5", 6));
	ge950ov23979 = (GE_ms("`$7\' is of the Infix form but `$8\' in $9 is not a function with one argument.", 77));
	ge950ov24277 = (GE_ms("vdrd3b", 6));
	ge950ov24122 = (GE_ms("VDRD-3", 6));
	ge950ov23899 = (GE_ms("feature `$7\' is redeclared but its postconditions do not begin with \'ensure then\'.", 82));
	ge950ov24276 = (GE_ms("vdrd3a", 6));
	ge950ov23898 = (GE_ms("feature `$7\' is redeclared but its preconditions do not begin with \'require else\'.", 82));
	ge950ov24282 = (GE_ms("vdrd6a", 6));
	ge950ov23904 = (GE_ms("attribute `$7\' inherited from $8 is not redeclared into an attribute.", 69));
	ge950ov24279 = (GE_ms("vdrd4b", 6));
	ge950ov24123 = (GE_ms("VDRD-4", 6));
	ge950ov23901 = (GE_ms("effective feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 98));
	ge950ov24280 = (GE_ms("vdrd4c", 6));
	ge950ov23902 = (GE_ms("effective feature `$8\' inherited from $9 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses.", 132));
	ge950ov24371 = (GE_ms("vmfn0b", 6));
	ge950ov23993 = (GE_ms("two features with the same name `$7\' in current class and `$8\' inherited from $9.", 81));
	ge950ov24278 = (GE_ms("vdrd4a", 6));
	ge950ov23900 = (GE_ms("deferred feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 97));
	ge950ov24292 = (GE_ms("vdrs4b", 6));
	ge950ov23914 = (GE_ms("redeclaration of feature `$7\' from $8 is an effecting and should not appear in the Redefine subclause.", 102));
	ge950ov24281 = (GE_ms("vdrd5a", 6));
	ge950ov24124 = (GE_ms("VDRD-5", 6));
	ge950ov23903 = (GE_ms("effective feature `$7\' inherited from $8 is redefined into a deferred one.", 74));
	ge950ov24286 = (GE_ms("vdrd7c", 6));
	ge950ov24126 = (GE_ms("VDRD-7", 6));
	ge950ov23908 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has a different one `$11\'.", 102));
	ge950ov24284 = (GE_ms("vdrd7a", 6));
	ge950ov23906 = (GE_ms("feature `$7\' inherited from $8 has no alias but its redeclared version has one `$10\'.", 85));
	ge950ov24285 = (GE_ms("vdrd7b", 6));
	ge950ov23907 = (GE_ms("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has none.", 85));
	ge950ov24379 = (GE_ms("vmss3a", 6));
	ge950ov24174 = (GE_ms("VMSS-3", 6));
	ge950ov24001 = (GE_ms("feature name `$7\' appears in the Select subclause of parent $8 but is not replicated.", 85));
	ge950ov24375 = (GE_ms("vmrc2a", 6));
	ge950ov24171 = (GE_ms("VMRC-2", 6));
	ge950ov23997 = (GE_ms("replicated features $6 have not been selected.", 46));
	ge950ov24377 = (GE_ms("vmss1a", 6));
	ge950ov24172 = (GE_ms("VMSS-1", 6));
	ge950ov23999 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge950ov24287 = (GE_ms("vdrs1a", 6));
	ge950ov24127 = (GE_ms("VDRS-1", 6));
	ge950ov23909 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge950ov24293 = (GE_ms("vdus1a", 6));
	ge950ov24131 = (GE_ms("VDUS-1", 6));
	ge950ov23915 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge950ov24368 = (GE_ms("vlel2a", 6));
	ge950ov24167 = (GE_ms("VLEL-2", 6));
	ge950ov23990 = (GE_ms("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge950ov24351 = (GE_ms("vhrc1a", 6));
	ge950ov24157 = (GE_ms("VHRC-1", 6));
	ge950ov23973 = (GE_ms("`$7\' is not the final name of a feature in $8.", 46));
	ge950ov24378 = (GE_ms("vmss2a", 6));
	ge950ov24173 = (GE_ms("VMSS-2", 6));
	ge950ov24000 = (GE_ms("feature name `$7\' appears twice in the Select subclause of parent $8.", 69));
	ge950ov24290 = (GE_ms("vdrs3a", 6));
	ge950ov24129 = (GE_ms("VDRS-3", 6));
	ge950ov23912 = (GE_ms("feature name `$7\' appears twice in the Redefine subclause of parent $8.", 71));
	ge950ov24297 = (GE_ms("vdus4a", 6));
	ge950ov24134 = (GE_ms("VDUS-4", 6));
	ge950ov23919 = (GE_ms("feature name `$7\' appears twice in the Undefine subclause of parent $8.", 71));
	ge950ov24369 = (GE_ms("vlel3a", 6));
	ge950ov24168 = (GE_ms("VLEL-3", 6));
	ge950ov23991 = (GE_ms("feature name `$7\' appears twice in the Export subclause of parent $8.", 69));
	ge950ov24367 = (GE_ms("vlel1a", 6));
	ge950ov24166 = (GE_ms("VLEL-1", 6));
	ge950ov23989 = (GE_ms("\'all\' keyword appears twice in the Export subclause of parent $7.", 65));
	ge950ov24352 = (GE_ms("vhrc2a", 6));
	ge950ov24158 = (GE_ms("VHRC-2", 6));
	ge950ov23974 = (GE_ms("feature name `$7\' appears as first element of two Rename_pairs.", 63));
	ge950ov24370 = (GE_ms("vmfn0a", 6));
	ge950ov23992 = (GE_ms("two features with the same name `$7\'.", 37));
	ge950ov24436 = (GE_ms("vtcg4a", 6));
	ge950ov24202 = (GE_ms("VTCG-4", 6));
	ge950ov24058 = (GE_ms("base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8\' available as creation procedure to class $10.", 131));
	ge950ov24437 = (GE_ms("vtcg4b", 6));
	ge950ov24059 = (GE_ms("the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8\' as creation procedure in its generic constraint.", 175));
	ge951ov6977 = (GE_ms("GE_argv", 7));
	ge951ov6938 = (GE_ms("default", 7));
	ge950ov24240 = (GE_ms("vape0d", 6));
	ge950ov23862 = (GE_ms("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge950ov24239 = (GE_ms("vape0c", 6));
	ge950ov23861 = (GE_ms("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge950ov24452 = (GE_ms("vuex2b", 6));
	ge950ov24211 = (GE_ms("VUEX-2", 6));
	ge950ov24074 = (GE_ms("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge950ov24446 = (GE_ms("vuar1c", 6));
	ge950ov24068 = (GE_ms("call to Tuple label `$7\' cannot have arguments.", 47));
	ge950ov24451 = (GE_ms("vuex2a", 6));
	ge950ov24073 = (GE_ms("`$7\' is not the final name of a feature in class $8.", 52));
	ge950ov24365 = (GE_ms("vkcn2a", 6));
	ge950ov23987 = (GE_ms("procedure `$8\' of class $9 appears in a call expression.", 56));
	ge950ov24400 = (GE_ms("vqmc6a", 6));
	ge950ov24188 = (GE_ms("VQMC-6", 6));
	ge950ov24022 = (GE_ms("bit constant attribute `$7\' is not declared of Bit_type.", 56));
	ge950ov24399 = (GE_ms("vqmc5a", 6));
	ge950ov24187 = (GE_ms("VQMC-5", 6));
	ge950ov24021 = (GE_ms("string constant attribute `$7\' is not declared of type STRING.", 62));
	ge950ov24398 = (GE_ms("vqmc4a", 6));
	ge950ov24186 = (GE_ms("VQMC-4", 6));
	ge950ov24020 = (GE_ms("real constant attribute `$7\' is not declared of type REAL or DOUBLE.", 68));
	ge950ov24397 = (GE_ms("vqmc3a", 6));
	ge950ov24185 = (GE_ms("VQMC-3", 6));
	ge950ov24019 = (GE_ms("integer constant attribute `$7\' is not declared of type INTEGER.", 64));
	ge950ov24396 = (GE_ms("vqmc2a", 6));
	ge950ov24184 = (GE_ms("VQMC-2", 6));
	ge950ov24018 = (GE_ms("character constant attribute `$7\' is not declared of type CHARACTER.", 68));
	ge950ov24395 = (GE_ms("vqmc1a", 6));
	ge950ov24183 = (GE_ms("VQMC-1", 6));
	ge950ov24017 = (GE_ms("boolean constant attribute `$7\' is not declared of type BOOLEAN.", 64));
	ge950ov24401 = (GE_ms("vqui0a", 6));
	ge950ov24189 = (GE_ms("VQUI", 4));
	ge950ov24023 = (GE_ms("unique attribute `$7\' is not declared of type INTEGER.", 54));
	ge950ov24410 = (GE_ms("vrle1a", 6));
	ge950ov24193 = (GE_ms("VRLE-1", 6));
	ge950ov24032 = (GE_ms("local variable name \'$7\' in feature `$8\' is also the final name of a feature.", 77));
	ge950ov24411 = (GE_ms("vrle2a", 6));
	ge950ov24194 = (GE_ms("VRLE-2", 6));
	ge950ov24033 = (GE_ms("local variable name \'$7\' in feature `$8\' is also the name of a formal argument of this feature.", 95));
	ge950ov24407 = (GE_ms("vreg0b", 6));
	ge950ov24029 = (GE_ms("local variable name \'$7\' appear twice in feature `$8\'.", 54));
	ge951ov7024 = (GE_ms("unsigned", 8));
	ge951ov7001 = (GE_ms("GE_rescue", 9));
	ge951ov7003 = (GE_ms("GE_setjmp", 9));
	ge951ov7000 = (GE_ms("GE_raise", 8));
	ge951ov7002 = (GE_ms("GE_retry", 8));
	ge951ov6986 = (GE_ms("GE_int8", 7));
	ge951ov6987 = (GE_ms("GE_int16", 8));
	ge951ov6988 = (GE_ms("GE_int32", 8));
	ge951ov6989 = (GE_ms("GE_int64", 8));
	ge951ov6993 = (GE_ms("GE_nat8", 7));
	ge951ov6994 = (GE_ms("GE_nat16", 8));
	ge951ov6995 = (GE_ms("GE_nat32", 8));
	ge951ov6996 = (GE_ms("GE_nat64", 8));
	ge950ov24334 = (GE_ms("vgcc6c", 6));
	ge950ov23956 = (GE_ms("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge950ov24337 = (GE_ms("vgcc8a", 6));
	ge950ov24151 = (GE_ms("VGCC-8", 6));
	ge950ov23959 = (GE_ms("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge950ov24330 = (GE_ms("vgcc5a", 6));
	ge950ov24149 = (GE_ms("VGCC-5", 6));
	ge950ov23952 = (GE_ms("creation expression with no Creation_call part, but $7 has a Creators part.", 75));
	ge950ov24333 = (GE_ms("vgcc6b", 6));
	ge950ov23955 = (GE_ms("`$7\' is not the final name of a procedure in class $9.", 54));
	ge950ov24268 = (GE_ms("vdpr3d", 6));
	ge950ov24118 = (GE_ms("VDPR-3", 6));
	ge950ov23890 = (GE_ms("feature `$7\' is not the redeclaration of a feature.", 51));
	ge950ov24263 = (GE_ms("vdpr1b", 6));
	ge950ov24116 = (GE_ms("VDPR-1", 6));
	ge950ov23885 = (GE_ms("Precursor expression does not appear in a Routine_body.", 55));
	ge950ov24266 = (GE_ms("vdpr3b", 6));
	ge950ov23888 = (GE_ms("feature `$7\' is not the redefinition of an effective feature.", 61));
	ge950ov24265 = (GE_ms("vdpr3a", 6));
	ge950ov23887 = (GE_ms("conflict in Precursor construct between effective features `$7\' inherited from \'$8\' and `$9\' inherited from \'$10\'.", 114));
	ge950ov24264 = (GE_ms("vdpr2a", 6));
	ge950ov24117 = (GE_ms("VDPR-2", 6));
	ge950ov23886 = (GE_ms("class $7 in Precursor construct is not a parent of class $6.", 60));
	ge950ov24449 = (GE_ms("vuar4a", 6));
	ge950ov24209 = (GE_ms("VUAR-4", 6));
	ge950ov24071 = (GE_ms("`$7\' is not the final name of a feature in class $5.", 52));
	ge950ov24454 = (GE_ms("vweq0a", 6));
	ge950ov24213 = (GE_ms("VWEQ", 4));
	ge950ov24076 = (GE_ms("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms to the other.", 76));
	ge774ov13642 = (GE_ms("***unknown_name***", 18));
	ge950ov24236 = (GE_ms("vaol1a", 6));
	ge950ov24104 = (GE_ms("VAOL-1", 6));
	ge950ov23858 = (GE_ms("old expression does not appear in a postcondition.", 50));
	ge950ov24383 = (GE_ms("vpca1b", 6));
	ge950ov24177 = (GE_ms("VPCA-1", 6));
	ge950ov24005 = (GE_ms("`$7\' is not the final name of a feature in class $8.", 52));
	ge950ov24390 = (GE_ms("vpca5b", 6));
	ge950ov24181 = (GE_ms("VPCA-5", 6));
	ge950ov24012 = (GE_ms("the type \'$10\' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 155));
	ge950ov24389 = (GE_ms("vpca5a", 6));
	ge950ov24011 = (GE_ms("the type \'$11\' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 168));
	ge950ov24388 = (GE_ms("vpca4b", 6));
	ge950ov24180 = (GE_ms("VPCA-4", 6));
	ge950ov24010 = (GE_ms("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge950ov24387 = (GE_ms("vpca4a", 6));
	ge950ov24009 = (GE_ms("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge950ov24386 = (GE_ms("vpca3b", 6));
	ge950ov24179 = (GE_ms("VPCA-3", 6));
	ge950ov24008 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge950ov24385 = (GE_ms("vpca3a", 6));
	ge950ov24007 = (GE_ms("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge950ov24384 = (GE_ms("vpca2a", 6));
	ge950ov24178 = (GE_ms("VPCA-2", 6));
	ge950ov24006 = (GE_ms("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge950ov24382 = (GE_ms("vpca1a", 6));
	ge950ov24004 = (GE_ms("`$7\' is not the final name of a feature in class $5.", 52));
	ge950ov24457 = (GE_ms("vwst2a", 6));
	ge950ov24215 = (GE_ms("VWST-2", 6));
	ge950ov24079 = (GE_ms("feature name `$7\' appears twice in strip expression.", 52));
	ge950ov24455 = (GE_ms("vwst1a", 6));
	ge950ov24214 = (GE_ms("VWST-1", 6));
	ge950ov24077 = (GE_ms("feature name `$7\' is not the final name of a feature in class $5.", 65));
	ge950ov24394 = (GE_ms("vpir1d", 6));
	ge950ov24182 = (GE_ms("VPIR-1", 6));
	ge950ov24016 = (GE_ms("local variable name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 118));
	ge950ov24393 = (GE_ms("vpir1c", 6));
	ge950ov24015 = (GE_ms("local variable name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 119));
	ge950ov24413 = (GE_ms("vrlv1b", 6));
	ge950ov24195 = (GE_ms("VRLV-1", 6));
	ge950ov24035 = (GE_ms("local variable name \'$7\' in inline agent is also the final name of a feature.", 77));
	ge950ov24415 = (GE_ms("vrlv2b", 6));
	ge950ov24196 = (GE_ms("VRLV-2", 6));
	ge950ov24037 = (GE_ms("local variable name \'$7\' in inline agent is also the name of a formal argument of this agent.", 93));
	ge950ov24405 = (GE_ms("vred0d", 6));
	ge950ov24190 = (GE_ms("VRED", 4));
	ge950ov24027 = (GE_ms("local variable name \'$7\' appear twice in inline agent.", 54));
	ge950ov24392 = (GE_ms("vpir1b", 6));
	ge950ov24014 = (GE_ms("argument name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 112));
	ge950ov24391 = (GE_ms("vpir1a", 6));
	ge950ov24013 = (GE_ms("argument name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 113));
	ge950ov24409 = (GE_ms("vrfa0b", 6));
	ge950ov24031 = (GE_ms("argument name \'$7\' in inline agent is also the final name of a feature.", 71));
	ge950ov24404 = (GE_ms("vred0c", 6));
	ge950ov24026 = (GE_ms("argument name \'$7\' appear twice in inline agent.", 48));
	ge950ov24471 = (GE_ms("gvtcg5a", 7));
	ge950ov24229 = (GE_ms("GVTCG-5", 7));
	ge950ov24093 = (GE_ms("actual generic parameter \'$7\' in type \'$8\' is not a reference type but the corresponding formal parameter is marked as reference.", 129));
	ge950ov24472 = (GE_ms("gvtcg5b", 7));
	ge950ov24094 = (GE_ms("actual generic parameter \'$7\' in type \'$8\' is not expanded type but the corresponding formal parameter is marked as expanded.", 125));
	ge950ov24443 = (GE_ms("vtug2a", 6));
	ge950ov24206 = (GE_ms("VTUG-2", 6));
	ge950ov24065 = (GE_ms("type \'$7\' has wrong number of actual generic parameters.", 56));
	ge950ov24442 = (GE_ms("vtug1a", 6));
	ge950ov24205 = (GE_ms("VTUG-1", 6));
	ge950ov24064 = (GE_ms("type \'$7\' has actual generic parameters but class $8 is not generic.", 68));
	ge950ov24435 = (GE_ms("vtcg3a", 6));
	ge950ov24201 = (GE_ms("VTCG-3", 6));
	ge950ov24057 = (GE_ms("actual generic parameter \'$7\' in type \'$9\' does not conform to constraint \'$8\'.", 79));
	ge950ov24461 = (GE_ms("gvhpr5a", 7));
	ge950ov24219 = (GE_ms("GVHPR-5", 7));
	ge950ov24083 = (GE_ms("cannot inherit from Tuple_type \'$7\'.", 36));
	ge950ov24250 = (GE_ms("vcfg3b", 6));
	ge950ov23872 = (GE_ms("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge950ov24349 = (GE_ms("vhpr3b", 6));
	ge950ov24156 = (GE_ms("VHPR-3", 6));
	ge950ov23971 = (GE_ms("invalid type \'$7\' in parent clause.", 35));
	ge950ov24460 = (GE_ms("gvhpr4a", 7));
	ge950ov24218 = (GE_ms("GVHPR-4", 7));
	ge950ov24082 = (GE_ms("cannot inherit from Bit_type \'$7\'.", 34));
	ge950ov24249 = (GE_ms("vcfg3a", 6));
	ge950ov23871 = (GE_ms("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge950ov24348 = (GE_ms("vhpr3a", 6));
	ge950ov23970 = (GE_ms("invalid type \'$7\' in parent clause.", 35));
	ge950ov24432 = (GE_ms("vtbt0b", 6));
	ge950ov24054 = (GE_ms("invalid type \'$7\': `$8\' is not the final name of a feature.", 59));
	ge950ov24431 = (GE_ms("vtbt0a", 6));
	ge950ov24053 = (GE_ms("invalid type \'$7\': `$8\' is not the final name of a constant attribute of type INTEGER.", 86));
	ge950ov24251 = (GE_ms("vcfg3c", 6));
	ge950ov23873 = (GE_ms("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge950ov24350 = (GE_ms("vhpr3c", 6));
	ge950ov23972 = (GE_ms("invalid type \'$7\' in parent clause.", 35));
	ge950ov24428 = (GE_ms("vtat1a", 6));
	ge950ov24198 = (GE_ms("VTAT-1", 6));
	ge950ov24050 = (GE_ms("invalid type \'$7\': the anchor `$8\' must be the final name of a query.", 69));
	ge950ov24429 = (GE_ms("vtat1b", 6));
	ge950ov24051 = (GE_ms("invalid type \'$7\': the anchor `$8\' must be the final name of a query, or an argument of routine `$9\'.", 101));
	ge950ov24243 = (GE_ms("vbac2a", 6));
	ge950ov24108 = (GE_ms("VBAC-2", 6));
	ge950ov23865 = (GE_ms("query `$7\' in class $8 has no assigner command.", 47));
	ge950ov24242 = (GE_ms("vbac1a", 6));
	ge950ov24107 = (GE_ms("VBAC-1", 6));
	ge950ov23864 = (GE_ms("the source of the assigner call (of type \'$7\') does not conform nor convert to its target (of type \'$8\').", 105));
	ge950ov24358 = (GE_ms("vjar0a", 6));
	ge950ov24161 = (GE_ms("VJAR", 4));
	ge950ov23980 = (GE_ms("the source of the assignment (of type \'$7\') does not conform nor convert to its target entity (of type \'$8\').", 109));
	ge950ov24298 = (GE_ms("veen0a", 6));
	ge950ov24135 = (GE_ms("VEEN", 4));
	ge950ov23920 = (GE_ms("`$7\' appears in feature `$8\', but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of feature `$8\'.", 152));
	ge950ov24299 = (GE_ms("veen0b", 6));
	ge950ov23921 = (GE_ms("`$7\' appears in an inline agent, but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of this inline agent.", 160));
	ge950ov24360 = (GE_ms("vjaw0b", 6));
	ge950ov24162 = (GE_ms("VJAW", 4));
	ge950ov23982 = (GE_ms("`$7\' is the name of a formal argument of feature `$8\'. A Writable is either a local variable (including Result) or an attribute.", 128));
	ge950ov24361 = (GE_ms("vjaw0c", 6));
	ge950ov23983 = (GE_ms("`$7\' is the name of a formal argument of an inline agent. A Writable is either a local variable (including Result) or an attribute.", 131));
	ge950ov24359 = (GE_ms("vjaw0a", 6));
	ge950ov23981 = (GE_ms("feature `$7\' is not an attribute. A Writable is either a local variable (including Result) or an attribute.", 107));
	ge950ov24362 = (GE_ms("vjrv0a", 6));
	ge950ov24163 = (GE_ms("VJRV", 4));
	ge950ov23984 = (GE_ms("the type \'$7\' of the target entity of the assignment attempt is not a reference type.", 85));
	ge950ov24381 = (GE_ms("vomb2a", 6));
	ge950ov24176 = (GE_ms("VOMB-2", 6));
	ge950ov24003 = (GE_ms("inspect constant of type \'$7\' different from type \'$8\' of inspect expression.", 77));
	ge950ov24380 = (GE_ms("vomb1a", 6));
	ge950ov24175 = (GE_ms("VOMB-1", 6));
	ge950ov24002 = (GE_ms("inspect expression of type \'$7\' different from INTEGER or CHARACTER.", 68));
	ge950ov24241 = (GE_ms("vave0a", 6));
	ge950ov24106 = (GE_ms("VAVE", 4));
	ge950ov23863 = (GE_ms("loop variant expression of non-INTEGER type \'$7\'.", 49));
	ge951ov7026 = (GE_ms("while", 5));
	ge950ov24336 = (GE_ms("vgcc6e", 6));
	ge950ov23958 = (GE_ms("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge950ov24338 = (GE_ms("vgcc8b", 6));
	ge950ov23960 = (GE_ms("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge950ov24331 = (GE_ms("vgcc5b", 6));
	ge950ov23953 = (GE_ms("creation instruction with no Creation_call part, but $7 has a Creators part.", 76));
	ge950ov24329 = (GE_ms("vgcc3a", 6));
	ge950ov24148 = (GE_ms("VGCC-3", 6));
	ge950ov23951 = (GE_ms("explicit creation type \'$7\' does not conform to target entity type \'$8\'.", 72));
	ge950ov24335 = (GE_ms("vgcc6d", 6));
	ge950ov23957 = (GE_ms("`$7\' is not the final name of a procedure in class $9.", 54));
	ge950ov24262 = (GE_ms("vdpr1a", 6));
	ge950ov23884 = (GE_ms("Precursor instruction does not appear in a Routine_body.", 56));
	ge950ov24363 = (GE_ms("vkcn1a", 6));
	ge950ov23985 = (GE_ms("query `$8\' of class $9 appears in a call instruction.", 53));
	ge950ov24439 = (GE_ms("vtct0b", 6));
	ge950ov24061 = (GE_ms("type based on unknown class $7.", 31));
	ge950ov24255 = (GE_ms("vcfg3h", 6));
	ge950ov23877 = (GE_ms("constraint of formal generic parameter \'$7\' contains \'$8\' itself.", 65));
	ge950ov24253 = (GE_ms("vcfg3e", 6));
	ge950ov23875 = (GE_ms("constraint of formal generic parameter \'$7\' is another formal generic parameter \'$8\'.", 85));
	ge950ov24252 = (GE_ms("vcfg3d", 6));
	ge950ov23874 = (GE_ms("constraint of formal generic parameter \'$7\' is \'$8\' itself.", 59));
	ge950ov24458 = (GE_ms("vxrt0a", 6));
	ge950ov24216 = (GE_ms("VXRT", 4));
	ge950ov24080 = (GE_ms("Retry instruction does not appear in a Rescue clause.", 53));
	ge951ov7006 = (GE_ms("goto", 4));
	ge860ov19051 = (GE_ms("TUPLE", 5));
	ge853ov22800 = (GE_ms("like Current", 12));
	ge856ov21865 = (GE_ms("like ", 5));
	ge832ov21897 = (GE_ms("BIT ", 4));
	ge1221ov9994 = (GE_ms("root", 4));
	ge1202ov19445 = (GE_ms("Namespace declared twice", 24));
	ge1202ov19444 = (GE_ms("Undeclared namespace error", 26));
	ge415ov9076 = (GE_ms("\n", 1));
	ge312ov9076 = (GE_ms("\n", 1));
	ge303ov9076 = (GE_ms("\n", 1));
	ge60ov4071 = (GE_ms("\n", 1));
	ge60ov4072 = (GE_ms("\n", 1));
	ge60ov4073 = (GE_ms("\nOptions:\n", 10));
	ge778ov22522 = (GE_ms("alias \"", 7));
	ge774ov13707 = (GE_ms("alias \"[]\"", 10));
	ge774ov13688 = (GE_ms("alias \"and\"", 11));
	ge774ov13704 = (GE_ms("alias \"and then\"", 16));
	ge774ov13692 = (GE_ms("alias \"//\"", 10));
	ge774ov13693 = (GE_ms("alias \"/\"", 9));
	ge774ov13694 = (GE_ms("alias \">=\"", 10));
	ge774ov13695 = (GE_ms("alias \">\"", 9));
	ge774ov13689 = (GE_ms("alias \"implies\"", 15));
	ge774ov13696 = (GE_ms("alias \"<=\"", 10));
	ge774ov13697 = (GE_ms("alias \"<\"", 9));
	ge774ov13698 = (GE_ms("alias \"-\"", 9));
	ge774ov13699 = (GE_ms("alias \"\\\\\"", 10));
	ge774ov13690 = (GE_ms("alias \"or\"", 10));
	ge774ov13705 = (GE_ms("alias \"or else\"", 15));
	ge774ov13700 = (GE_ms("alias \"+\"", 9));
	ge774ov13701 = (GE_ms("alias \"^\"", 9));
	ge774ov13702 = (GE_ms("alias \"*\"", 9));
	ge774ov13691 = (GE_ms("alias \"xor\"", 11));
	ge774ov13703 = (GE_ms("alias \"..\"", 10));
	ge774ov13706 = (GE_ms("alias \"not\"", 11));
	ge1269ov24659 = (GE_ms("us-ascii", 8));
	ge1269ov24661 = (GE_ms("utf-8", 5));
	ge774ov13684 = (GE_ms("infix \"or else\"", 15));
	ge774ov13683 = (GE_ms("infix \"and then\"", 16));
	ge774ov13671 = (GE_ms("infix \"//\"", 10));
	ge774ov13672 = (GE_ms("infix \"/\"", 9));
	ge774ov13673 = (GE_ms("infix \">=\"", 10));
	ge774ov13674 = (GE_ms("infix \">\"", 9));
	ge774ov13675 = (GE_ms("infix \"<=\"", 10));
	ge774ov13676 = (GE_ms("infix \"<\"", 9));
	ge774ov13677 = (GE_ms("infix \"-\"", 9));
	ge774ov13678 = (GE_ms("infix \"\\\\\"", 10));
	ge774ov13679 = (GE_ms("infix \"+\"", 9));
	ge774ov13680 = (GE_ms("infix \"^\"", 9));
	ge774ov13681 = (GE_ms("infix \"*\"", 9));
	ge774ov13682 = (GE_ms("infix \"..\"", 10));
	ge774ov13686 = (GE_ms("prefix \"-\"", 10));
	ge774ov13687 = (GE_ms("prefix \"+\"", 10));
	ge774ov13667 = (GE_ms("infix \"and\"", 11));
	ge774ov13668 = (GE_ms("infix \"implies\"", 15));
	ge774ov13669 = (GE_ms("infix \"or\"", 10));
	ge774ov13670 = (GE_ms("infix \"xor\"", 11));
	ge774ov13685 = (GE_ms("prefix \"not\"", 12));
	ge800ov20831 = (GE_ms("infix \"", 7));
	ge800ov20830 = (GE_ms("prefix \"", 8));
	ge805ov22615 = (GE_ms("infix \"", 7));
	ge815ov22507 = (GE_ms("prefix \"", 8));
	ge1018ov3850 = (GE_ms("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge1015ov3850 = (GE_ms("found invalid expression \'$1\' at $2", 35));
	ge231ov3850 = (GE_ms("$0: too many (i.e. $1) nested include files", 43));
	ge230ov3850 = (GE_ms("Syntax error in \"$1\" at line $2", 31));
	ge1009ov3850 = (GE_ms("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1025ov3850 = (GE_ms("option name \'$1\' in option-element is unknown $2", 48));
	ge1022ov3850 = (GE_ms("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1021ov3850 = (GE_ms("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1017ov3850 = (GE_ms("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1024ov3850 = (GE_ms("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1016ov3850 = (GE_ms("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1028ov3850 = (GE_ms("Xace document must have a \'$1\' root-element $2", 46));
	ge1012ov3850 = (GE_ms("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1023ov3850 = (GE_ms("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1027ov3850 = (GE_ms("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1019ov3850 = (GE_ms("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1010ov3850 = (GE_ms("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge225ov3850 = (GE_ms("$0: cannot write to \'$1\'", 24));
	ge228ov3850 = (GE_ms("$1", 2));
	ge235ov3850 = (GE_ms("$0 version $1", 13));
	ge224ov3850 = (GE_ms("$0: cannot read \'$1\'", 20));
	ge409ov24738 = (GE_ms("", 0));
	ge396ov1685 = (GE_ms("", 0));
}

EIF_TYPE GE_types[1465] = {
{0, EIF_FALSE},
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
{0, 116, EIF_TRUE},
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
{0, 130, EIF_TRUE},
{0, 131, EIF_FALSE},
{0, 132, EIF_TRUE},
{0, 133, EIF_FALSE},
{0, 134, EIF_FALSE},
{0, 135, EIF_FALSE},
{0, 136, EIF_FALSE},
{0, 137, EIF_FALSE},
{0, 138, EIF_FALSE},
{0, 139, EIF_TRUE},
{0, 140, EIF_TRUE},
{0, 141, EIF_FALSE},
{0, 142, EIF_TRUE},
{0, 143, EIF_TRUE},
{0, 144, EIF_FALSE},
{0, 145, EIF_FALSE},
{0, 146, EIF_FALSE},
{0, 147, EIF_TRUE},
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
{0, 324, EIF_TRUE},
{0, 325, EIF_FALSE},
{0, 326, EIF_FALSE},
{0, 327, EIF_TRUE},
{0, 328, EIF_FALSE},
{0, 329, EIF_FALSE},
{0, 330, EIF_FALSE},
{0, 331, EIF_FALSE},
{0, 332, EIF_FALSE},
{0, 333, EIF_FALSE},
{0, 334, EIF_FALSE},
{0, 335, EIF_TRUE},
{0, 336, EIF_FALSE},
{0, 337, EIF_FALSE},
{0, 338, EIF_FALSE},
{0, 339, EIF_FALSE},
{0, 340, EIF_FALSE},
{0, 341, EIF_FALSE},
{0, 342, EIF_FALSE},
{0, 343, EIF_FALSE},
{0, 344, EIF_TRUE},
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
{0, 357, EIF_FALSE},
{0, 358, EIF_FALSE},
{0, 359, EIF_FALSE},
{0, 360, EIF_FALSE},
{0, 361, EIF_FALSE},
{0, 362, EIF_TRUE},
{0, 363, EIF_FALSE},
{0, 364, EIF_TRUE},
{0, 365, EIF_FALSE},
{0, 366, EIF_TRUE},
{0, 367, EIF_TRUE},
{0, 368, EIF_FALSE},
{0, 369, EIF_TRUE},
{0, 370, EIF_FALSE},
{0, 371, EIF_TRUE},
{0, 372, EIF_FALSE},
{0, 373, EIF_FALSE},
{0, 374, EIF_TRUE},
{0, 375, EIF_FALSE},
{0, 376, EIF_TRUE},
{0, 377, EIF_FALSE},
{0, 378, EIF_FALSE},
{0, 379, EIF_TRUE},
{0, 380, EIF_FALSE},
{0, 381, EIF_FALSE},
{0, 382, EIF_FALSE},
{0, 383, EIF_FALSE},
{0, 384, EIF_FALSE},
{0, 385, EIF_FALSE},
{0, 386, EIF_FALSE},
{0, 387, EIF_FALSE},
{0, 388, EIF_FALSE},
{0, 389, EIF_FALSE},
{0, 390, EIF_FALSE},
{0, 391, EIF_FALSE},
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
{0, 411, EIF_TRUE},
{0, 412, EIF_TRUE},
{0, 413, EIF_FALSE},
{0, 414, EIF_FALSE},
{0, 415, EIF_TRUE},
{0, 416, EIF_FALSE},
{0, 417, EIF_FALSE},
{0, 418, EIF_FALSE},
{0, 419, EIF_FALSE},
{0, 420, EIF_FALSE},
{0, 421, EIF_FALSE},
{0, 422, EIF_FALSE},
{0, 423, EIF_FALSE},
{0, 424, EIF_FALSE},
{0, 425, EIF_FALSE},
{0, 426, EIF_FALSE},
{0, 427, EIF_FALSE},
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
{0, 440, EIF_TRUE},
{0, 441, EIF_FALSE},
{0, 442, EIF_FALSE},
{0, 443, EIF_TRUE},
{0, 444, EIF_FALSE},
{0, 445, EIF_FALSE},
{0, 446, EIF_TRUE},
{0, 447, EIF_FALSE},
{0, 448, EIF_FALSE},
{0, 449, EIF_TRUE},
{0, 450, EIF_FALSE},
{0, 451, EIF_TRUE},
{0, 452, EIF_FALSE},
{0, 453, EIF_FALSE},
{0, 454, EIF_TRUE},
{0, 455, EIF_FALSE},
{0, 456, EIF_FALSE},
{0, 457, EIF_TRUE},
{0, 458, EIF_FALSE},
{0, 459, EIF_FALSE},
{0, 460, EIF_TRUE},
{0, 461, EIF_FALSE},
{0, 462, EIF_FALSE},
{0, 463, EIF_TRUE},
{0, 464, EIF_FALSE},
{0, 465, EIF_TRUE},
{0, 466, EIF_FALSE},
{0, 467, EIF_FALSE},
{0, 468, EIF_TRUE},
{0, 469, EIF_FALSE},
{0, 470, EIF_FALSE},
{0, 471, EIF_TRUE},
{0, 472, EIF_FALSE},
{0, 473, EIF_FALSE},
{0, 474, EIF_TRUE},
{0, 475, EIF_FALSE},
{0, 476, EIF_TRUE},
{0, 477, EIF_FALSE},
{0, 478, EIF_FALSE},
{0, 479, EIF_TRUE},
{0, 480, EIF_FALSE},
{0, 481, EIF_TRUE},
{0, 482, EIF_FALSE},
{0, 483, EIF_FALSE},
{0, 484, EIF_TRUE},
{0, 485, EIF_FALSE},
{0, 486, EIF_FALSE},
{0, 487, EIF_TRUE},
{0, 488, EIF_FALSE},
{0, 489, EIF_FALSE},
{0, 490, EIF_TRUE},
{0, 491, EIF_FALSE},
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
{0, 502, EIF_FALSE},
{0, 503, EIF_FALSE},
{0, 504, EIF_FALSE},
{0, 505, EIF_FALSE},
{0, 506, EIF_FALSE},
{0, 507, EIF_FALSE},
{0, 508, EIF_FALSE},
{0, 509, EIF_FALSE},
{0, 510, EIF_FALSE},
{0, 511, EIF_FALSE},
{0, 512, EIF_FALSE},
{0, 513, EIF_FALSE},
{0, 514, EIF_FALSE},
{0, 515, EIF_FALSE},
{0, 516, EIF_TRUE},
{0, 517, EIF_FALSE},
{0, 518, EIF_TRUE},
{0, 519, EIF_TRUE},
{0, 520, EIF_FALSE},
{0, 521, EIF_TRUE},
{0, 522, EIF_FALSE},
{0, 523, EIF_TRUE},
{0, 524, EIF_FALSE},
{0, 525, EIF_TRUE},
{0, 526, EIF_FALSE},
{0, 527, EIF_TRUE},
{0, 528, EIF_FALSE},
{0, 529, EIF_FALSE},
{0, 530, EIF_TRUE},
{0, 531, EIF_FALSE},
{0, 532, EIF_TRUE},
{0, 533, EIF_FALSE},
{0, 534, EIF_FALSE},
{0, 535, EIF_FALSE},
{0, 536, EIF_FALSE},
{0, 537, EIF_FALSE},
{0, 538, EIF_TRUE},
{0, 539, EIF_FALSE},
{0, 540, EIF_FALSE},
{0, 541, EIF_TRUE},
{0, 542, EIF_FALSE},
{0, 543, EIF_FALSE},
{0, 544, EIF_TRUE},
{0, 545, EIF_FALSE},
{0, 546, EIF_FALSE},
{0, 547, EIF_TRUE},
{0, 548, EIF_FALSE},
{0, 549, EIF_TRUE},
{0, 550, EIF_FALSE},
{0, 551, EIF_FALSE},
{0, 552, EIF_TRUE},
{0, 553, EIF_FALSE},
{0, 554, EIF_TRUE},
{0, 555, EIF_FALSE},
{0, 556, EIF_FALSE},
{0, 557, EIF_FALSE},
{0, 558, EIF_TRUE},
{0, 559, EIF_FALSE},
{0, 560, EIF_FALSE},
{0, 561, EIF_TRUE},
{0, 562, EIF_FALSE},
{0, 563, EIF_FALSE},
{0, 564, EIF_TRUE},
{0, 565, EIF_FALSE},
{0, 566, EIF_TRUE},
{0, 567, EIF_FALSE},
{0, 568, EIF_FALSE},
{0, 569, EIF_FALSE},
{0, 570, EIF_TRUE},
{0, 571, EIF_FALSE},
{0, 572, EIF_FALSE},
{0, 573, EIF_FALSE},
{0, 574, EIF_FALSE},
{0, 575, EIF_TRUE},
{0, 576, EIF_FALSE},
{0, 577, EIF_FALSE},
{0, 578, EIF_FALSE},
{0, 579, EIF_FALSE},
{0, 580, EIF_FALSE},
{0, 581, EIF_FALSE},
{0, 582, EIF_TRUE},
{0, 583, EIF_TRUE},
{0, 584, EIF_FALSE},
{0, 585, EIF_TRUE},
{0, 586, EIF_TRUE},
{0, 587, EIF_TRUE},
{0, 588, EIF_TRUE},
{0, 589, EIF_FALSE},
{0, 590, EIF_FALSE},
{0, 591, EIF_FALSE},
{0, 592, EIF_TRUE},
{0, 593, EIF_TRUE},
{0, 594, EIF_TRUE},
{0, 595, EIF_FALSE},
{0, 596, EIF_FALSE},
{0, 597, EIF_FALSE},
{0, 598, EIF_FALSE},
{0, 599, EIF_TRUE},
{0, 600, EIF_TRUE},
{0, 601, EIF_FALSE},
{0, 602, EIF_FALSE},
{0, 603, EIF_FALSE},
{0, 604, EIF_TRUE},
{0, 605, EIF_FALSE},
{0, 606, EIF_FALSE},
{0, 607, EIF_FALSE},
{0, 608, EIF_FALSE},
{0, 609, EIF_TRUE},
{0, 610, EIF_FALSE},
{0, 611, EIF_FALSE},
{0, 612, EIF_FALSE},
{0, 613, EIF_FALSE},
{0, 614, EIF_FALSE},
{0, 615, EIF_TRUE},
{0, 616, EIF_FALSE},
{0, 617, EIF_FALSE},
{0, 618, EIF_FALSE},
{0, 619, EIF_TRUE},
{0, 620, EIF_FALSE},
{0, 621, EIF_TRUE},
{0, 622, EIF_FALSE},
{0, 623, EIF_FALSE},
{0, 624, EIF_TRUE},
{0, 625, EIF_FALSE},
{0, 626, EIF_FALSE},
{0, 627, EIF_FALSE},
{0, 628, EIF_FALSE},
{0, 629, EIF_TRUE},
{0, 630, EIF_FALSE},
{0, 631, EIF_TRUE},
{0, 632, EIF_FALSE},
{0, 633, EIF_FALSE},
{0, 634, EIF_TRUE},
{0, 635, EIF_FALSE},
{0, 636, EIF_TRUE},
{0, 637, EIF_TRUE},
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
{0, 648, EIF_FALSE},
{0, 649, EIF_TRUE},
{0, 650, EIF_FALSE},
{0, 651, EIF_TRUE},
{0, 652, EIF_FALSE},
{0, 653, EIF_TRUE},
{0, 654, EIF_FALSE},
{0, 655, EIF_FALSE},
{0, 656, EIF_FALSE},
{0, 657, EIF_FALSE},
{0, 658, EIF_TRUE},
{0, 659, EIF_FALSE},
{0, 660, EIF_FALSE},
{0, 661, EIF_FALSE},
{0, 662, EIF_FALSE},
{0, 663, EIF_FALSE},
{0, 664, EIF_FALSE},
{0, 665, EIF_FALSE},
{0, 666, EIF_FALSE},
{0, 667, EIF_FALSE},
{0, 668, EIF_FALSE},
{0, 669, EIF_FALSE},
{0, 670, EIF_FALSE},
{0, 671, EIF_TRUE},
{0, 672, EIF_FALSE},
{0, 673, EIF_FALSE},
{0, 674, EIF_FALSE},
{0, 675, EIF_FALSE},
{0, 676, EIF_FALSE},
{0, 677, EIF_TRUE},
{0, 678, EIF_TRUE},
{0, 679, EIF_FALSE},
{0, 680, EIF_FALSE},
{0, 681, EIF_FALSE},
{0, 682, EIF_FALSE},
{0, 683, EIF_FALSE},
{0, 684, EIF_TRUE},
{0, 685, EIF_FALSE},
{0, 686, EIF_TRUE},
{0, 687, EIF_FALSE},
{0, 688, EIF_FALSE},
{0, 689, EIF_FALSE},
{0, 690, EIF_TRUE},
{0, 691, EIF_FALSE},
{0, 692, EIF_FALSE},
{0, 693, EIF_FALSE},
{0, 694, EIF_FALSE},
{0, 695, EIF_TRUE},
{0, 696, EIF_FALSE},
{0, 697, EIF_FALSE},
{0, 698, EIF_TRUE},
{0, 699, EIF_FALSE},
{0, 700, EIF_FALSE},
{0, 701, EIF_FALSE},
{0, 702, EIF_FALSE},
{0, 703, EIF_TRUE},
{0, 704, EIF_FALSE},
{0, 705, EIF_FALSE},
{0, 706, EIF_FALSE},
{0, 707, EIF_FALSE},
{0, 708, EIF_FALSE},
{0, 709, EIF_FALSE},
{0, 710, EIF_FALSE},
{0, 711, EIF_FALSE},
{0, 712, EIF_TRUE},
{0, 713, EIF_TRUE},
{0, 714, EIF_FALSE},
{0, 715, EIF_FALSE},
{0, 716, EIF_FALSE},
{0, 717, EIF_FALSE},
{0, 718, EIF_TRUE},
{0, 719, EIF_TRUE},
{0, 720, EIF_FALSE},
{0, 721, EIF_FALSE},
{0, 722, EIF_FALSE},
{0, 723, EIF_TRUE},
{0, 724, EIF_FALSE},
{0, 725, EIF_TRUE},
{0, 726, EIF_FALSE},
{0, 727, EIF_FALSE},
{0, 728, EIF_FALSE},
{0, 729, EIF_TRUE},
{0, 730, EIF_FALSE},
{0, 731, EIF_FALSE},
{0, 732, EIF_FALSE},
{0, 733, EIF_FALSE},
{0, 734, EIF_TRUE},
{0, 735, EIF_FALSE},
{0, 736, EIF_FALSE},
{0, 737, EIF_FALSE},
{0, 738, EIF_FALSE},
{0, 739, EIF_FALSE},
{0, 740, EIF_TRUE},
{0, 741, EIF_FALSE},
{0, 742, EIF_TRUE},
{0, 743, EIF_FALSE},
{0, 744, EIF_FALSE},
{0, 745, EIF_FALSE},
{0, 746, EIF_TRUE},
{0, 747, EIF_FALSE},
{0, 748, EIF_FALSE},
{0, 749, EIF_FALSE},
{0, 750, EIF_TRUE},
{0, 751, EIF_FALSE},
{0, 752, EIF_TRUE},
{0, 753, EIF_FALSE},
{0, 754, EIF_FALSE},
{0, 755, EIF_FALSE},
{0, 756, EIF_TRUE},
{0, 757, EIF_FALSE},
{0, 758, EIF_TRUE},
{0, 759, EIF_FALSE},
{0, 760, EIF_FALSE},
{0, 761, EIF_TRUE},
{0, 762, EIF_FALSE},
{0, 763, EIF_FALSE},
{0, 764, EIF_FALSE},
{0, 765, EIF_FALSE},
{0, 766, EIF_TRUE},
{0, 767, EIF_FALSE},
{0, 768, EIF_TRUE},
{0, 769, EIF_FALSE},
{0, 770, EIF_FALSE},
{0, 771, EIF_FALSE},
{0, 772, EIF_TRUE},
{0, 773, EIF_FALSE},
{0, 774, EIF_FALSE},
{0, 775, EIF_FALSE},
{0, 776, EIF_FALSE},
{0, 777, EIF_FALSE},
{0, 778, EIF_FALSE},
{0, 779, EIF_FALSE},
{0, 780, EIF_FALSE},
{0, 781, EIF_FALSE},
{0, 782, EIF_TRUE},
{0, 783, EIF_FALSE},
{0, 784, EIF_TRUE},
{0, 785, EIF_FALSE},
{0, 786, EIF_FALSE},
{0, 787, EIF_FALSE},
{0, 788, EIF_FALSE},
{0, 789, EIF_FALSE},
{0, 790, EIF_FALSE},
{0, 791, EIF_FALSE},
{0, 792, EIF_FALSE},
{0, 793, EIF_FALSE},
{0, 794, EIF_FALSE},
{0, 795, EIF_FALSE},
{0, 796, EIF_FALSE},
{0, 797, EIF_FALSE},
{0, 798, EIF_FALSE},
{0, 799, EIF_TRUE},
{0, 800, EIF_FALSE},
{0, 801, EIF_TRUE},
{0, 802, EIF_FALSE},
{0, 803, EIF_FALSE},
{0, 804, EIF_TRUE},
{0, 805, EIF_FALSE},
{0, 806, EIF_TRUE},
{0, 807, EIF_FALSE},
{0, 808, EIF_TRUE},
{0, 809, EIF_FALSE},
{0, 810, EIF_FALSE},
{0, 811, EIF_FALSE},
{0, 812, EIF_FALSE},
{0, 813, EIF_FALSE},
{0, 814, EIF_FALSE},
{0, 815, EIF_FALSE},
{0, 816, EIF_FALSE},
{0, 817, EIF_FALSE},
{0, 818, EIF_TRUE},
{0, 819, EIF_FALSE},
{0, 820, EIF_TRUE},
{0, 821, EIF_FALSE},
{0, 822, EIF_FALSE},
{0, 823, EIF_FALSE},
{0, 824, EIF_FALSE},
{0, 825, EIF_FALSE},
{0, 826, EIF_FALSE},
{0, 827, EIF_FALSE},
{0, 828, EIF_FALSE},
{0, 829, EIF_FALSE},
{0, 830, EIF_FALSE},
{0, 831, EIF_TRUE},
{0, 832, EIF_FALSE},
{0, 833, EIF_TRUE},
{0, 834, EIF_FALSE},
{0, 835, EIF_FALSE},
{0, 836, EIF_FALSE},
{0, 837, EIF_FALSE},
{0, 838, EIF_FALSE},
{0, 839, EIF_FALSE},
{0, 840, EIF_FALSE},
{0, 841, EIF_TRUE},
{0, 842, EIF_FALSE},
{0, 843, EIF_FALSE},
{0, 844, EIF_FALSE},
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
{0, 861, EIF_TRUE},
{0, 862, EIF_FALSE},
{0, 863, EIF_FALSE},
{0, 864, EIF_FALSE},
{0, 865, EIF_FALSE},
{0, 866, EIF_TRUE},
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
{0, 879, EIF_TRUE},
{0, 880, EIF_FALSE},
{0, 881, EIF_FALSE},
{0, 882, EIF_FALSE},
{0, 883, EIF_FALSE},
{0, 884, EIF_FALSE},
{0, 885, EIF_FALSE},
{0, 886, EIF_FALSE},
{0, 887, EIF_FALSE},
{0, 888, EIF_FALSE},
{0, 889, EIF_FALSE},
{0, 890, EIF_FALSE},
{0, 891, EIF_TRUE},
{0, 892, EIF_FALSE},
{0, 893, EIF_FALSE},
{0, 894, EIF_FALSE},
{0, 895, EIF_FALSE},
{0, 896, EIF_FALSE},
{0, 897, EIF_FALSE},
{0, 898, EIF_FALSE},
{0, 899, EIF_FALSE},
{0, 900, EIF_FALSE},
{0, 901, EIF_TRUE},
{0, 902, EIF_FALSE},
{0, 903, EIF_FALSE},
{0, 904, EIF_FALSE},
{0, 905, EIF_TRUE},
{0, 906, EIF_FALSE},
{0, 907, EIF_FALSE},
{0, 908, EIF_TRUE},
{0, 909, EIF_FALSE},
{0, 910, EIF_FALSE},
{0, 911, EIF_FALSE},
{0, 912, EIF_FALSE},
{0, 913, EIF_FALSE},
{0, 914, EIF_FALSE},
{0, 915, EIF_FALSE},
{0, 916, EIF_FALSE},
{0, 917, EIF_FALSE},
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
{0, 962, EIF_TRUE},
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
{0, 977, EIF_FALSE},
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
{0, 996, EIF_TRUE},
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
{0, 1013, EIF_TRUE},
{0, 1014, EIF_FALSE},
{0, 1015, EIF_FALSE},
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
{0, 1032, EIF_FALSE},
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
{0, 1044, EIF_TRUE},
{0, 1045, EIF_FALSE},
{0, 1046, EIF_FALSE},
{0, 1047, EIF_FALSE},
{0, 1048, EIF_FALSE},
{0, 1049, EIF_TRUE},
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
{0, 1063, EIF_FALSE},
{0, 1064, EIF_FALSE},
{0, 1065, EIF_FALSE},
{0, 1066, EIF_FALSE},
{0, 1067, EIF_FALSE},
{0, 1068, EIF_FALSE},
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
{0, 1190, EIF_TRUE},
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
{0, 1209, EIF_FALSE},
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
{0, 1222, EIF_TRUE},
{0, 1223, EIF_FALSE},
{0, 1224, EIF_FALSE},
{0, 1225, EIF_FALSE},
{0, 1226, EIF_FALSE},
{0, 1227, EIF_TRUE},
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
{0, 1248, EIF_TRUE},
{0, 1249, EIF_FALSE},
{0, 1250, EIF_FALSE},
{0, 1251, EIF_FALSE},
{0, 1252, EIF_FALSE},
{0, 1253, EIF_FALSE},
{0, 1254, EIF_FALSE},
{0, 1255, EIF_FALSE},
{0, 1256, EIF_FALSE},
{0, 1257, EIF_FALSE},
{0, 1258, EIF_FALSE},
{0, 1259, EIF_FALSE},
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
{0, 1270, EIF_TRUE},
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
{0, 1290, EIF_FALSE},
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
{0, 1309, EIF_TRUE},
{0, 1310, EIF_TRUE},
{0, 1311, EIF_TRUE},
{0, 1312, EIF_FALSE},
{0, 1313, EIF_FALSE},
{0, 1314, EIF_FALSE},
{0, 1315, EIF_FALSE},
{0, 1316, EIF_FALSE},
{0, 1317, EIF_FALSE},
{0, 1318, EIF_FALSE},
{0, 1319, EIF_FALSE},
{0, 1320, EIF_TRUE},
{0, 1321, EIF_FALSE},
{0, 1322, EIF_FALSE},
{0, 1323, EIF_FALSE},
{0, 1324, EIF_FALSE},
{0, 1325, EIF_FALSE},
{0, 1326, EIF_FALSE},
{0, 1327, EIF_FALSE},
{0, 1328, EIF_FALSE},
{0, 1329, EIF_FALSE},
{0, 1330, EIF_TRUE},
{0, 1331, EIF_FALSE},
{0, 1332, EIF_FALSE},
{0, 1333, EIF_FALSE},
{0, 1334, EIF_FALSE},
{0, 1335, EIF_TRUE},
{0, 1336, EIF_FALSE},
{0, 1337, EIF_FALSE},
{0, 1338, EIF_TRUE},
{0, 1339, EIF_FALSE},
{0, 1340, EIF_FALSE},
{0, 1341, EIF_FALSE},
{0, 1342, EIF_FALSE},
{0, 1343, EIF_FALSE},
{0, 1344, EIF_FALSE},
{0, 1345, EIF_FALSE},
{0, 1346, EIF_FALSE},
{0, 1347, EIF_FALSE},
{0, 1348, EIF_FALSE},
{0, 1349, EIF_FALSE},
{0, 1350, EIF_FALSE},
{0, 1351, EIF_FALSE},
{0, 1352, EIF_FALSE},
{0, 1353, EIF_FALSE},
{0, 1354, EIF_FALSE},
{0, 1355, EIF_FALSE},
{0, 1356, EIF_FALSE},
{0, 1357, EIF_FALSE},
{0, 1358, EIF_FALSE},
{0, 1359, EIF_FALSE},
{0, 1360, EIF_FALSE},
{0, 1361, EIF_FALSE},
{0, 1362, EIF_FALSE},
{0, 1363, EIF_FALSE},
{0, 1364, EIF_FALSE},
{0, 1365, EIF_FALSE},
{0, 1366, EIF_FALSE},
{0, 1367, EIF_FALSE},
{0, 1368, EIF_FALSE},
{0, 1369, EIF_FALSE},
{0, 1370, EIF_FALSE},
{0, 1371, EIF_FALSE},
{0, 1372, EIF_FALSE},
{0, 1373, EIF_FALSE},
{0, 1374, EIF_FALSE},
{0, 1375, EIF_FALSE},
{0, 1376, EIF_FALSE},
{0, 1377, EIF_FALSE},
{0, 1378, EIF_TRUE},
{0, 1379, EIF_FALSE},
{0, 1380, EIF_FALSE},
{0, 1381, EIF_FALSE},
{0, 1382, EIF_FALSE},
{0, 1383, EIF_FALSE},
{0, 1384, EIF_FALSE},
{0, 1385, EIF_FALSE},
{0, 1386, EIF_FALSE},
{0, 1387, EIF_FALSE},
{0, 1388, EIF_FALSE},
{0, 1389, EIF_FALSE},
{0, 1390, EIF_FALSE},
{0, 1391, EIF_FALSE},
{0, 1392, EIF_FALSE},
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
{0, 1403, EIF_TRUE},
{0, 1404, EIF_FALSE},
{0, 1405, EIF_FALSE},
{0, 1406, EIF_FALSE},
{0, 1407, EIF_TRUE},
{0, 1408, EIF_FALSE},
{0, 1409, EIF_FALSE},
{0, 1410, EIF_FALSE},
{0, 1411, EIF_FALSE},
{0, 1412, EIF_TRUE},
{0, 1413, EIF_FALSE},
{0, 1414, EIF_FALSE},
{0, 1415, EIF_FALSE},
{0, 1416, EIF_TRUE},
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
{0, 1428, EIF_FALSE},
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
{0, 1447, EIF_TRUE},
{0, 1448, EIF_FALSE},
{0, 1449, EIF_FALSE},
{0, 1450, EIF_FALSE},
{0, 1451, EIF_FALSE},
{0, 1452, EIF_FALSE},
{0, 1453, EIF_FALSE},
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
{0, 1464, EIF_FALSE}
};

int main(int argc, char** argv)
{
	T0* t1;
	GE_argc = argc;
	GE_argv = argv;
	GE_rescue = 0;
	GE_init_gc();
	GE_const_init();
#ifdef EIF_WINDOWS
	eif_hInstance = GetModuleHandle(NULL);
#endif
	t1 = T21c32();
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

	/* Clean up function */
typedef void (* EIF_CLEANUP)(EIF_BOOLEAN);
void eif_register_cleanup(EIF_CLEANUP f){
	/* TODO: Needed to compile some code at AXAR */
	printf("'eif_register_cleanup' in 'ge_arguments.h' not implemented\n");
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
struct GE_rescue *GE_rescue;

/* Raise an exception with code `code'. */
void GE_raise(int code) {
	struct GE_rescue *r = GE_rescue;
	if (r != 0) {
		GE_rescue = r->previous;
		GE_longjmp(r->jb, code);
	}
	fprintf(stderr, "Unhandled exception\n");
	exit(1);
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
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	int code;
	int argc;
	char** argv;
	char* cmd;
	cmd = strdup(GetCommandLine());
	GE_get_argcargv(cmd, &argc, &argv);
	code = main(argc, argv);
	free(cmd);
	free(argv);
	return code;
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

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifdef EIF_WINDOWS
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#include <utime.h>
#else
#include <sys/utime.h>
#endif
#include <io.h> /* for access, chmod */
#include <direct.h> /* for (ch|mk|rm)dir */
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

#ifdef __cplusplus
extern "C" {
#endif

void file_mkdir(char* dirname) {
#ifdef WIN32
	mkdir(dirname);
#else
	mkdir(dirname, 0777);
#endif
}

void file_rename(char* from, char* to) {
#ifdef WIN32
	struct stat buf;

	if (stat(to, &buf) != -1) {
		remove(to);
	}
#endif
	rename(from, to);
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
	return GE_ms(str, strlen(str));
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
	return GE_ms(str, strlen(str));
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
	copyright: "Copyright (c) 2006, Eric Bezault and others"
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

#ifdef EIF_WINDOWS
void set_windows_exception_filter() {
	/* TODO: Needed to compile some code at AXAR */
	printf("'set_windows_exception_filter' in 'eif_except.h' not implemented\n");
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
		if (FindNextFile(h, &(GE_dir->data))) {
			char* s = GE_dir->data.cFileName;
			return GE_ms(s,strlen(s));
		} else {
			return EIF_VOID;
		}
	} else {
		h = FindFirstFile(GE_dir->pattern, &(GE_dir->data));
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
