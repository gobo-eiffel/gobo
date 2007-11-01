#include "gexace.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
T0* T212f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T212f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T211f5(T0* C)
{
	T0* R = 0;
	R = (T211f3(C, ge1119ov2346));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T211f3(T0* C, T0* a1)
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
	t1 = (T211f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T211f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T211f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T211f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T211*)(C))->a1), l3));
						if (t2) {
							t1 = (T211f4(C));
							t5 = (T66f5(GE_void(((T211*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T211f4(C));
								t5 = (T211f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T211f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T211f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T211f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T211f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T210f5(T0* C)
{
	T0* R = 0;
	R = (T210f3(C, ge1131ov2346));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T210f3(T0* C, T0* a1)
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
	t1 = (T210f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T210f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T210f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T210f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T210*)(C))->a1), l3));
						if (t2) {
							t1 = (T210f4(C));
							t5 = (T66f5(GE_void(((T210*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T210f4(C));
								t5 = (T210f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T210f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T210f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T210f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T210f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T209f5(T0* C)
{
	T0* R = 0;
	R = (T209f3(C, ge1115ov2346));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T209f3(T0* C, T0* a1)
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
	t1 = (T209f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T209f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T209f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T209f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T209*)(C))->a1), l3));
						if (t2) {
							t1 = (T209f4(C));
							t5 = (T66f5(GE_void(((T209*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T209f4(C));
								t5 = (T209f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T209f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T209f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T209f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T209f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T208f5(T0* C)
{
	T0* R = 0;
	R = (T208f3(C, ge1126ov2346));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T208f3(T0* C, T0* a1)
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
	t1 = (T208f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T208f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T208f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T208f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T208*)(C))->a1), l3));
						if (t2) {
							t1 = (T208f4(C));
							t5 = (T66f5(GE_void(((T208*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T208f4(C));
								t5 = (T208f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T208f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T208f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T208f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T208f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T207f5(T0* C)
{
	T0* R = 0;
	R = (T207f3(C, ge1130ov2346));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T207f3(T0* C, T0* a1)
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
	t1 = (T207f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T207f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T207f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T207f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T207*)(C))->a1), l3));
						if (t2) {
							t1 = (T207f4(C));
							t5 = (T66f5(GE_void(((T207*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T207f4(C));
								t5 = (T207f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T207f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T207f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T207f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T206f5(T0* C)
{
	T0* R = 0;
	R = (T206f3(C, ge1122ov2346));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T206f3(T0* C, T0* a1)
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
	t1 = (T206f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T206f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T206f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T206f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T206*)(C))->a1), l3));
						if (t2) {
							t1 = (T206f4(C));
							t5 = (T66f5(GE_void(((T206*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T206f4(C));
								t5 = (T206f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T206f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T206f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T206f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T206f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T205f5(T0* C)
{
	T0* R = 0;
	R = (T205f3(C, ge1113ov2346));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T205f3(T0* C, T0* a1)
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
	t1 = (T205f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T205f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T205f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T205f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T205*)(C))->a1), l3));
						if (t2) {
							t1 = (T205f4(C));
							t5 = (T66f5(GE_void(((T205*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T205f4(C));
								t5 = (T205f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T205f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T205f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T205f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T205f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
T0* T109f5(T0* C)
{
	T0* R = 0;
	R = (T109f3(C, ge1123ov2346));
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.message */
T0* T109f3(T0* C, T0* a1)
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
	t1 = (T109f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T109f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T109f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T109f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T109*)(C))->a1), l3));
						if (t2) {
							t1 = (T109f4(C));
							t5 = (T66f5(GE_void(((T109*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T109f4(C));
								t5 = (T109f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T109f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T109f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T109f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
T0* T109f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T108f5(T0* C)
{
	T0* R = 0;
	R = (T108f3(C, ge1156ov2346));
	return R;
}

/* UT_MESSAGE.message */
T0* T108f3(T0* C, T0* a1)
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
	t1 = (T108f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T108f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T108f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T108f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T108*)(C))->a1), l3));
						if (t2) {
							t1 = (T108f4(C));
							t5 = (T66f5(GE_void(((T108*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T108f4(C));
								t5 = (T108f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T108f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T108f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T108f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T108f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T88f5(T0* C)
{
	T0* R = 0;
	R = (T88f3(C, ge1153ov2346));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T88f3(T0* C, T0* a1)
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
	t1 = (T88f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T88f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T88f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T88f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T88*)(C))->a1), l3));
						if (t2) {
							t1 = (T88f4(C));
							t5 = (T66f5(GE_void(((T88*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T88f4(C));
								t5 = (T88f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T88f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T88f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T88f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T88f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T87f5(T0* C)
{
	T0* R = 0;
	R = (T87f3(C, ge1152ov2346));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T87f3(T0* C, T0* a1)
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
	t1 = (T87f4(C));
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T87f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T87f4(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T87f4(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T87*)(C))->a1), l3));
						if (t2) {
							t1 = (T87f4(C));
							t5 = (T66f5(GE_void(((T87*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T87f4(C));
								t5 = (T87f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T87f4(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T87f4(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
T0* T87f6(T0* C)
{
	T0* R = 0;
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T87f4(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T34f2(T0* C)
{
	T0* R = 0;
	R = (T34f4(C, ge1162ov2346));
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
	R = (T50f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f9(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T226f55(R, l5);
				}
			} else {
				t1 = (T34f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T50f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T226f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f9(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T226f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T34f5(C));
					l1 = (T50f2(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f9(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T226f55(l1, l5);
									}
								} else {
									t1 = (T34f5(C));
									T50f15(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f9(a1, l2));
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
									T226f55(l1, l5);
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
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f12(l1):T226f25(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f13(l1):T226f26(l1)));
						t2 = (T66f4(GE_void(((T34*)(C))->a1), l3));
						if (t2) {
							t1 = (T34f5(C));
							t5 = (T66f5(GE_void(((T34*)(C))->a1), l3));
							R = (T50f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T34f5(C));
								t5 = (T34f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T50f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T226f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T226f55(R, (T2)('{'));
									}
								}
								t1 = (T34f5(C));
								R = (T50f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T226f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T226f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T226f55(R, (T2)('{'));
							}
						}
						t1 = (T34f5(C));
						R = (T50f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T226f55(R, (T2)('}'));
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
	if (ge132os1584) {
		return ge132ov1584;
	} else {
		ge132os1584 = '\1';
	}
	R = T23c4();
	ge132ov1584 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T34f5(T0* C)
{
	T0* R = 0;
	if (ge86os1585) {
		return ge86ov1585;
	} else {
		ge86os1585 = '\1';
	}
	R = T50c14();
	ge86ov1585 = R;
	return R;
}

T0* GE_ma223(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T54)+c*sizeof(T6));
	((T0*)(t1))->id = 54;
	((T54*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T6 *i = ((T54*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T223));
	((T0*)(R))->id = 223;
	((T223*)(R))->a1 = t1;
	((T223*)(R))->a2 = 1;
	((T223*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma66(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T53)+c*sizeof(T0*));
	((T0*)(t1))->id = 53;
	((T53*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T53*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T66));
	((T0*)(R))->id = 66;
	((T66*)(R))->a1 = t1;
	((T66*)(R))->a2 = 1;
	((T66*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma151(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T150)+c*sizeof(T0*));
	((T0*)(t1))->id = 150;
	((T150*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T150*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T151));
	((T0*)(R))->id = 151;
	((T151*)(R))->a1 = t1;
	((T151*)(R))->a2 = 1;
	((T151*)(R))->a3 = (T6)c;
	return R;
}

T0* ge1135ov2366;
T0* ge1137ov2366;
T0* ge1136ov2366;
T0* ge1137ov2365;
T0* ge1136ov2365;
T0* ge216ov2730;
T0* ge220ov2602;
T0* ge56ov1919;
T0* ge56ov1920;
T0* ge226ov3662;
T0* ge159ov8417;
T0* ge1315ov7562;
T0* ge1315ov7563;
T0* ge204ov4522;
T0* ge1306ov8425;
T0* ge1306ov8427;
T0* ge1258ov5149;
T0* ge1239ov7407;
T0* ge1239ov7406;
T0* ge1110ov4209;
T0* ge1110ov4201;
T0* ge1110ov4211;
T0* ge1110ov4198;
T0* ge1110ov4203;
T0* ge1110ov4204;
T0* ge1110ov4205;
T0* ge1110ov4192;
T0* ge1110ov4188;
T0* ge1110ov4206;
T0* ge1110ov4200;
T0* ge1110ov4193;
T0* ge1110ov4189;
T0* ge1110ov4195;
T0* ge1110ov4210;
T0* ge1110ov4207;
T0* ge1110ov4199;
T0* ge1110ov4197;
T0* ge1110ov4194;
T0* ge1110ov4196;
T0* ge1110ov4215;
T0* ge1110ov4212;
T0* ge1110ov4190;
T0* ge223ov2730;
T0* ge1110ov4202;
T0* ge1135ov2508;
T0* ge193ov4542;
T0* ge1110ov4213;
T0* ge1301ov5439;
T0* ge1301ov5438;
T0* ge1143ov4024;
T0* ge1110ov4208;
T0* ge1110ov4191;
T0* ge1143ov4023;
T0* ge1143ov4022;
T0* ge1110ov4025;
T0* ge1110ov4026;
T0* ge1110ov4027;
T0* ge1110ov4028;
T0* ge1110ov4029;
T0* ge1110ov4030;
T0* ge1110ov4031;
T0* ge1110ov4032;
T0* ge1110ov4033;
T0* ge1110ov4034;
T0* ge1110ov4035;
T0* ge1110ov4036;
T0* ge1110ov4037;
T0* ge1110ov4038;
T0* ge1110ov4039;
T0* ge1110ov4040;
T0* ge1110ov4041;
T0* ge1110ov4042;
T0* ge1110ov4043;
T0* ge1110ov4044;
T0* ge1110ov4045;
T0* ge1110ov4046;
T0* ge1110ov4047;
T0* ge1110ov4048;
T0* ge1110ov4049;
T0* ge1110ov4050;
T0* ge1110ov4051;
T0* ge1110ov4052;
T0* ge1110ov4053;
T0* ge1110ov4054;
T0* ge1110ov4055;
T0* ge1110ov4056;
T0* ge1110ov4057;
T0* ge1110ov4058;
T0* ge1110ov4059;
T0* ge1110ov4060;
T0* ge1110ov4061;
T0* ge1110ov4062;
T0* ge1110ov4063;
T0* ge1110ov4064;
T0* ge1110ov4065;
T0* ge1110ov4066;
T0* ge1110ov4067;
T0* ge1110ov4068;
T0* ge1110ov4069;
T0* ge1110ov4070;
T0* ge1110ov4071;
T0* ge1110ov4072;
T0* ge1110ov4073;
T0* ge1110ov4074;
T0* ge1110ov4075;
T0* ge1110ov4076;
T0* ge1110ov4077;
T0* ge1110ov4078;
T0* ge1110ov4079;
T0* ge1110ov4080;
T0* ge1110ov4081;
T0* ge1110ov4082;
T0* ge1110ov4083;
T0* ge1110ov4084;
T0* ge1110ov4085;
T0* ge1110ov4086;
T0* ge1110ov4087;
T0* ge1110ov4088;
T0* ge1110ov4089;
T0* ge1110ov4090;
T0* ge1110ov4091;
T0* ge1110ov4092;
T0* ge1110ov4093;
T0* ge1110ov4094;
T0* ge1110ov4095;
T0* ge1110ov4096;
T0* ge1110ov4097;
T0* ge1110ov4098;
T0* ge1110ov4099;
T0* ge1110ov4100;
T0* ge1110ov4101;
T0* ge1110ov4102;
T0* ge1110ov4103;
T0* ge1110ov4104;
T0* ge1110ov4105;
T0* ge111ov2730;
T0* ge1100ov6343;
T0* ge1106ov5124;
T0* ge1308ov6064;
T0* ge1308ov6026;
T0* ge1308ov6024;
T0* ge1308ov6065;
T0* ge1308ov6037;
T0* ge1308ov6036;
T0* ge1308ov6047;
T0* ge1308ov6041;
T0* ge1308ov6040;
T0* ge1308ov6039;
T0* ge1308ov6045;
T0* ge1308ov6044;
T0* ge1308ov6046;
T0* ge1308ov6023;
T0* ge1308ov6049;
T0* ge1308ov6058;
T0* ge1311ov5788;
T0* ge1311ov5786;
T0* ge1311ov5787;
T0* ge1308ov6059;
T0* ge1308ov6060;
T0* ge1308ov6063;
T0* ge1308ov6061;
T0* ge1308ov6062;
T0* ge1308ov6056;
T0* ge1304ov8005;
T0* ge1304ov8006;
T0* ge1308ov6029;
T0* ge1308ov6052;
T0* ge1308ov6072;
T0* ge1308ov6073;
T0* ge1308ov6074;
T0* ge1308ov6067;
T0* ge1308ov6050;
T0* ge1308ov6051;
T0* ge1308ov6053;
T0* ge1308ov6057;
T0* ge1306ov8424;
T0* ge1306ov8426;
T0* ge1121ov2346;
T0* ge1118ov2346;
T0* ge1112ov2346;
T0* ge1128ov2346;
T0* ge1125ov2346;
T0* ge1127ov2346;
T0* ge1124ov2346;
T0* ge1120ov2346;
T0* ge1119ov2346;
T0* ge1131ov2346;
T0* ge1115ov2346;
T0* ge1126ov2346;
T0* ge1130ov2346;
T0* ge1122ov2346;
T0* ge1113ov2346;
T0* ge1123ov2346;
T0* ge1156ov2346;
T0* ge1153ov2346;
T0* ge1152ov2346;
T0* ge1162ov2346;

void GE_const_init()
{
	ge1135ov2366 = (GE_ms("loadpath.se", 11));
	ge1137ov2366 = (GE_ms("ve.xace", 7));
	ge1136ov2366 = (GE_ms("ve.eld", 6));
	ge1137ov2365 = (GE_ms("ve.xace", 7));
	ge1136ov2365 = (GE_ms("ve.esd", 6));
	ge216ov2730 = (GE_ms("\n", 1));
	ge220ov2602 = (GE_ms("", 0));
	ge56ov1919 = (GE_ms("system.xace", 11));
	ge56ov1920 = (GE_ms("library.xace", 12));
	ge226ov3662 = (GE_ms("", 0));
	ge159ov8417 = (GE_ms("", 0));
	ge1315ov7562 = (GE_ms(" ", 1));
	ge1315ov7563 = (GE_ms("  ", 2));
	ge204ov4522 = (GE_ms("", 0));
	ge1306ov8425 = (GE_ms("iso-8859-1", 10));
	ge1306ov8427 = (GE_ms("utf-16", 6));
	ge1258ov5149 = (GE_ms("root", 4));
	ge1239ov7407 = (GE_ms("Namespace declared twice", 24));
	ge1239ov7406 = (GE_ms("Undeclared namespace error", 26));
	ge1110ov4209 = (GE_ms("none", 4));
	ge1110ov4201 = (GE_ms("generate", 8));
	ge1110ov4211 = (GE_ms("require", 7));
	ge1110ov4198 = (GE_ms("ensure", 6));
	ge1110ov4203 = (GE_ms("invariant", 9));
	ge1110ov4204 = (GE_ms("loop_invariant", 14));
	ge1110ov4205 = (GE_ms("loop_variant", 12));
	ge1110ov4192 = (GE_ms("check", 5));
	ge1110ov4188 = (GE_ms("all", 3));
	ge1110ov4206 = (GE_ms("low_level", 9));
	ge1110ov4200 = (GE_ms("feature", 7));
	ge1110ov4193 = (GE_ms("class", 5));
	ge1110ov4189 = (GE_ms("array", 5));
	ge1110ov4195 = (GE_ms("constant", 8));
	ge1110ov4210 = (GE_ms("once", 4));
	ge1110ov4207 = (GE_ms("microsoft", 9));
	ge1110ov4199 = (GE_ms("exe", 3));
	ge1110ov4197 = (GE_ms("dll", 3));
	ge1110ov4194 = (GE_ms("com", 3));
	ge1110ov4196 = (GE_ms("default", 7));
	ge1110ov4215 = (GE_ms("winapi", 6));
	ge1110ov4212 = (GE_ms("sequential", 10));
	ge1110ov4190 = (GE_ms("auto", 4));
	ge223ov2730 = (GE_ms("\n", 1));
	ge1110ov4202 = (GE_ms("internal", 8));
	ge1135ov2508 = (GE_ms("cecil.se", 8));
	ge193ov4542 = (GE_ms("empty_name", 10));
	ge1110ov4213 = (GE_ms("style", 5));
	ge1301ov5439 = (GE_ms("undefined", 9));
	ge1301ov5438 = (GE_ms("(TRUNCATED)", 11));
	ge1143ov4024 = (GE_ms("", 0));
	ge1110ov4208 = (GE_ms("no_main", 7));
	ge1110ov4191 = (GE_ms("boehm", 5));
	ge1143ov4023 = (GE_ms("false", 5));
	ge1143ov4022 = (GE_ms("true", 4));
	ge1110ov4025 = (GE_ms("abstract", 8));
	ge1110ov4026 = (GE_ms("address_expression", 18));
	ge1110ov4027 = (GE_ms("arguments", 9));
	ge1110ov4028 = (GE_ms("array_optimization", 18));
	ge1110ov4029 = (GE_ms("assembly", 8));
	ge1110ov4030 = (GE_ms("assertion", 9));
	ge1110ov4031 = (GE_ms("callback", 8));
	ge1110ov4032 = (GE_ms("case_insensitive", 16));
	ge1110ov4033 = (GE_ms("check_vape", 10));
	ge1110ov4034 = (GE_ms("clean", 5));
	ge1110ov4035 = (GE_ms("cls_compliant", 13));
	ge1110ov4036 = (GE_ms("component", 9));
	ge1110ov4037 = (GE_ms("console_application", 19));
	ge1110ov4038 = (GE_ms("create_keyword_extension", 24));
	ge1110ov4039 = (GE_ms("culture", 7));
	ge1110ov4040 = (GE_ms("c_compiler_options", 18));
	ge1110ov4041 = (GE_ms("dead_code_removal", 17));
	ge1110ov4042 = (GE_ms("debug", 5));
	ge1110ov4043 = (GE_ms("debug_tag", 9));
	ge1110ov4044 = (GE_ms("debugger", 8));
	ge1110ov4045 = (GE_ms("document", 8));
	ge1110ov4046 = (GE_ms("dotnet_naming_convention", 24));
	ge1110ov4047 = (GE_ms("dynamic_runtime", 15));
	ge1110ov4048 = (GE_ms("exception_trace", 15));
	ge1110ov4049 = (GE_ms("exclude", 7));
	ge1110ov4050 = (GE_ms("export", 6));
	ge1110ov4051 = (GE_ms("finalize", 8));
	ge1110ov4052 = (GE_ms("flat_fst_optimization", 21));
	ge1110ov4053 = (GE_ms("fst_expansion_factor", 20));
	ge1110ov4054 = (GE_ms("fst_optimization", 16));
	ge1110ov4055 = (GE_ms("garbage_collector", 17));
	ge1110ov4056 = (GE_ms("gc_info", 7));
	ge1110ov4057 = (GE_ms("heap_size", 9));
	ge1110ov4058 = (GE_ms("header", 6));
	ge1110ov4059 = (GE_ms("high_memory_compiler", 20));
	ge1110ov4060 = (GE_ms("il_verifiable", 13));
	ge1110ov4061 = (GE_ms("include", 7));
	ge1110ov4062 = (GE_ms("inlining", 8));
	ge1110ov4063 = (GE_ms("inlining_size", 13));
	ge1110ov4064 = (GE_ms("jumps_optimization", 18));
	ge1110ov4065 = (GE_ms("layout", 6));
	ge1110ov4066 = (GE_ms("layout_optimization", 19));
	ge1110ov4067 = (GE_ms("leaves_optimization", 19));
	ge1110ov4068 = (GE_ms("line_generation", 15));
	ge1110ov4069 = (GE_ms("link", 4));
	ge1110ov4070 = (GE_ms("linker", 6));
	ge1110ov4071 = (GE_ms("linux_fpu_double_precision", 26));
	ge1110ov4072 = (GE_ms("manifest_string_trace", 21));
	ge1110ov4073 = (GE_ms("map", 3));
	ge1110ov4074 = (GE_ms("metadata_cache_path", 19));
	ge1110ov4075 = (GE_ms("msil_assembly_compatibility", 27));
	ge1110ov4076 = (GE_ms("msil_clr_version", 16));
	ge1110ov4077 = (GE_ms("msil_generation", 15));
	ge1110ov4078 = (GE_ms("msil_generation_version", 23));
	ge1110ov4079 = (GE_ms("multithreaded", 13));
	ge1110ov4080 = (GE_ms("namespace", 9));
	ge1110ov4081 = (GE_ms("no_default_lib", 14));
	ge1110ov4082 = (GE_ms("override_cluster", 16));
	ge1110ov4083 = (GE_ms("portable_code_generation", 24));
	ge1110ov4084 = (GE_ms("precompiled", 11));
	ge1110ov4085 = (GE_ms("prefix", 6));
	ge1110ov4086 = (GE_ms("profile", 7));
	ge1110ov4087 = (GE_ms("public_key_token", 16));
	ge1110ov4088 = (GE_ms("read_only", 9));
	ge1110ov4089 = (GE_ms("recursive", 9));
	ge1110ov4090 = (GE_ms("reloads_optimization", 20));
	ge1110ov4091 = (GE_ms("shared_library_definition", 25));
	ge1110ov4092 = (GE_ms("split", 5));
	ge1110ov4093 = (GE_ms("stack_size", 10));
	ge1110ov4094 = (GE_ms("storable", 8));
	ge1110ov4095 = (GE_ms("storable_filename", 17));
	ge1110ov4096 = (GE_ms("strip", 5));
	ge1110ov4097 = (GE_ms("target", 6));
	ge1110ov4098 = (GE_ms("trace", 5));
	ge1110ov4099 = (GE_ms("use_cluster_name_as_namespace", 29));
	ge1110ov4100 = (GE_ms("use_full_cluster_name_as_namespace", 34));
	ge1110ov4101 = (GE_ms("verbose", 7));
	ge1110ov4102 = (GE_ms("version", 7));
	ge1110ov4103 = (GE_ms("visible_filename", 16));
	ge1110ov4104 = (GE_ms("warning", 7));
	ge1110ov4105 = (GE_ms("wedit", 5));
	ge111ov2730 = (GE_ms("\n", 1));
	ge1100ov6343 = (GE_ms("", 0));
	ge1106ov5124 = (GE_ms("", 0));
	ge1308ov6064 = (GE_ms("PE reference only allowed in DTD", 32));
	ge1308ov6026 = (GE_ms("< not allowed in attribute value", 32));
	ge1308ov6024 = (GE_ms("-- not allowed in comment", 25));
	ge1308ov6065 = (GE_ms("xml prefix reserved in processing instruction", 45));
	ge1308ov6037 = (GE_ms("Misformed XML Declaration", 25));
	ge1308ov6036 = (GE_ms("Misplaced markup declaration", 28));
	ge1308ov6047 = (GE_ms("End tag does not match start tag", 32));
	ge1308ov6041 = (GE_ms("Missing element end tag", 23));
	ge1308ov6040 = (GE_ms("Error in element content", 24));
	ge1308ov6039 = (GE_ms("Misformed start tag", 19));
	ge1308ov6045 = (GE_ms("Attribute declared twice", 24));
	ge1308ov6044 = (GE_ms("Misformed attribute in tag", 26));
	ge1308ov6046 = (GE_ms("Error in end tag", 16));
	ge1308ov6023 = (GE_ms("]]> not allowed in content", 26));
	ge1308ov6049 = (GE_ms("Error in XML declaration", 24));
	ge1308ov6058 = (GE_ms("Misformed element type declaration", 34));
	ge1311ov5788 = (GE_ms("*", 1));
	ge1311ov5786 = (GE_ms("+", 1));
	ge1311ov5787 = (GE_ms("\?", 1));
	ge1308ov6059 = (GE_ms("Misformed attribute list declaration", 36));
	ge1308ov6060 = (GE_ms("Misformed attribute definition declaration", 42));
	ge1308ov6063 = (GE_ms("Misformed conditional section", 29));
	ge1308ov6061 = (GE_ms("Misformed entity declaration", 28));
	ge1308ov6062 = (GE_ms("Misformed entity notation", 25));
	ge1308ov6056 = (GE_ms("Parser is not configured to support external DTDs", 49));
	ge1304ov8005 = (GE_ms("1.0", 3));
	ge1304ov8006 = (GE_ms("utf-8", 5));
	ge1308ov6029 = (GE_ms("unsupported character encoding", 30));
	ge1308ov6052 = (GE_ms("External reference in quoted value", 34));
	ge1308ov6072 = (GE_ms("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1308ov6073 = (GE_ms("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1308ov6074 = (GE_ms("Invalid UTF8 character sequence", 31));
	ge1308ov6067 = (GE_ms("Name misformed", 14));
	ge1308ov6050 = (GE_ms("Literal entity expected in attribute", 36));
	ge1308ov6051 = (GE_ms("Entity is not defined", 21));
	ge1308ov6053 = (GE_ms("Entity cannot be recursively included", 37));
	ge1308ov6057 = (GE_ms("Undefined PE entity", 19));
	ge1306ov8424 = (GE_ms("us-ascii", 8));
	ge1306ov8426 = (GE_ms("utf-8", 5));
	ge1121ov2346 = (GE_ms("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge1118ov2346 = (GE_ms("found invalid expression \'$1\' at $2", 35));
	ge1112ov2346 = (GE_ms("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1128ov2346 = (GE_ms("option name \'$1\' in option-element is unknown $2", 48));
	ge1125ov2346 = (GE_ms("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1127ov2346 = (GE_ms("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1124ov2346 = (GE_ms("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1120ov2346 = (GE_ms("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1119ov2346 = (GE_ms("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1131ov2346 = (GE_ms("Xace document must have a \'$1\' root-element $2", 46));
	ge1115ov2346 = (GE_ms("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1126ov2346 = (GE_ms("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1130ov2346 = (GE_ms("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1122ov2346 = (GE_ms("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1113ov2346 = (GE_ms("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1123ov2346 = (GE_ms("\'$1\' is not an Xace file", 24));
	ge1156ov2346 = (GE_ms("$1", 2));
	ge1153ov2346 = (GE_ms("$0: cannot write to \'$1\'", 24));
	ge1152ov2346 = (GE_ms("$0: cannot read \'$1\'", 20));
	ge1162ov2346 = (GE_ms("usage: $0 $1", 12));
}

EIF_TYPE GE_types[351] = {
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
{0, 53, EIF_TRUE},
{0, 54, EIF_TRUE},
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
{0, 107, EIF_TRUE},
{0, 108, EIF_FALSE},
{0, 109, EIF_FALSE},
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
{0, 148, EIF_TRUE},
{0, 149, EIF_FALSE},
{0, 150, EIF_TRUE},
{0, 151, EIF_FALSE},
{0, 152, EIF_FALSE},
{0, 153, EIF_FALSE},
{0, 154, EIF_FALSE},
{0, 155, EIF_FALSE},
{0, 156, EIF_FALSE},
{0, 157, EIF_FALSE},
{0, 158, EIF_FALSE},
{0, 159, EIF_TRUE},
{0, 160, EIF_FALSE},
{0, 161, EIF_FALSE},
{0, 162, EIF_FALSE},
{0, 163, EIF_FALSE},
{0, 164, EIF_FALSE},
{0, 165, EIF_FALSE},
{0, 166, EIF_FALSE},
{0, 167, EIF_FALSE},
{0, 168, EIF_FALSE},
{0, 169, EIF_TRUE},
{0, 170, EIF_FALSE},
{0, 171, EIF_FALSE},
{0, 172, EIF_FALSE},
{0, 173, EIF_FALSE},
{0, 174, EIF_FALSE},
{0, 175, EIF_FALSE},
{0, 176, EIF_FALSE},
{0, 177, EIF_FALSE},
{0, 178, EIF_FALSE},
{0, 179, EIF_TRUE},
{0, 180, EIF_FALSE},
{0, 181, EIF_TRUE},
{0, 182, EIF_FALSE},
{0, 183, EIF_TRUE},
{0, 184, EIF_TRUE},
{0, 185, EIF_FALSE},
{0, 186, EIF_TRUE},
{0, 187, EIF_FALSE},
{0, 188, EIF_TRUE},
{0, 189, EIF_FALSE},
{0, 190, EIF_FALSE},
{0, 191, EIF_TRUE},
{0, 192, EIF_FALSE},
{0, 193, EIF_TRUE},
{0, 194, EIF_FALSE},
{0, 195, EIF_FALSE},
{0, 196, EIF_TRUE},
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
{0, 231, EIF_TRUE},
{0, 232, EIF_FALSE},
{0, 233, EIF_FALSE},
{0, 234, EIF_TRUE},
{0, 235, EIF_FALSE},
{0, 236, EIF_FALSE},
{0, 237, EIF_FALSE},
{0, 238, EIF_FALSE},
{0, 239, EIF_FALSE},
{0, 240, EIF_FALSE},
{0, 241, EIF_TRUE},
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
{0, 265, EIF_TRUE},
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
{0, 319, EIF_TRUE},
{0, 320, EIF_TRUE},
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
{0, 336, EIF_FALSE},
{0, 337, EIF_FALSE},
{0, 338, EIF_FALSE},
{0, 339, EIF_FALSE},
{0, 340, EIF_TRUE},
{0, 341, EIF_FALSE},
{0, 342, EIF_FALSE},
{0, 343, EIF_FALSE},
{0, 344, EIF_FALSE},
{0, 345, EIF_FALSE},
{0, 346, EIF_FALSE},
{0, 347, EIF_FALSE},
{0, 348, EIF_FALSE},
{0, 349, EIF_FALSE},
{0, 350, EIF_FALSE}
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
extern int utime(const char *, struct utimbuf *); /* Needed for lcc-win32 */
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
			return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
#endif
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
			return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
#endif
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
			return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
#endif
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
